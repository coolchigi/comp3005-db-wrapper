const Database = require("better-sqlite3");
const db = new Database("data/products_database.db");

exports.api_customers = function (req, res) {
  const queryResult = req.query.name;
  let result = { customers_data: [] };
  const statement = db.prepare(
    "SELECT uid, uName FROM customers WHERE uName = ?"
  );
  const customer = statement.get(queryResult);
  //returns everything in customers table
  result.customers_data.push(customer);
  res.writeHead(200, {
    "Content-Type": "application/json"
  });
  res.end(JSON.stringify(result));
  // res.status(200).json(result);
};

exports.api_products = function (req, res) {
  const queryResult = req.query.category;
  let result = { products: [] };
  const statement = db.prepare(
    "SELECT pid, product_name from products WHERE category=?"
  );
  const empty = [];

  const product = statement.all(queryResult);
  if (product.length === 0) {
    res.writeHead(200, {
      "Content-Type": "application/json"
    });
    res.end(JSON.stringify(empty));
  } else {
    result.products.push(product);
    res.writeHead(200, {
      "Content-Type": "application/json"
    });
    res.end(JSON.stringify(result));
  }
};

exports.api_products_details = function (req, res) {
  // /products/details/0
  let id = req.params.id;
  let data = db.prepare("SELECT * from products WHERE pid = ?");
  let result = data.all(id);
  res.writeHead(200, {
    "Content-Type": "application/json"
  });
  res.end(JSON.stringify(result));
  // songID = songID.substring(songID.lastIndexOf("/") + 1, songID.length);
};

exports.api_fproducts = function (req, res) {
  let user = req.params.username;
  let data = db.prepare(
    "select uName, product_name from favorite_products INNER join customers on favorite_products.user_id = customers.uid inner join products on products.pid = favorite_products.item_id where uName = ?"
  );
  let result = data.all(user);
  none = [];
  if (result.length === 0) {
    res.writeHead(200, {
      "Content-Type": "application/json"
    });
    res.end(JSON.stringify(none));
  } else {
    res.writeHead(200, {
      "Content-Type": "application/json"
    });
    res.end(JSON.stringify(result));
  }
};

exports.api_store = function (req, res) {
  const storeName = req.params.storename;
  console.log(storeName);

  none = [];
  let data = db.prepare(
    "SELECT product_name, price from hasP inner join stores on hasP.store_id = stores.sid inner join products on hasP.product_id = products.pid where store_name = ?"
  );
  let result = data.all(storeName);
  console.log(result);
  if (result.length === 0) {
    res.writeHead(200, {
      "Content-Type": "application/json"
    });
    res.end(JSON.stringify(none));
  } else {
    res.writeHead(200, {
      "Content-Type": "application/json"
    });
    res.end(JSON.stringify(result));
  }
};
