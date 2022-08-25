const express = require("express");
const path = require("path");
const app = express();
const bodyParser = require("body-parser");

const PORT = process.env.PORT || 3000;
const routes = require("./routes/product_router");

app.use(bodyParser.json()); //parse JSON in POST bodies.
app.use(express.static(path.join(__dirname, "public")));
app.use(express.json());
app.use((req, res, next) => {
  console.log(`${req.method} : ${req.url}`);
  if (Object.keys(req.body).length > 0) {
    console.log("boday!");
    console.log("REQUEST BODY: ", req.body);
  }
  next();
});
app.get("/customers", routes.api_customers);
app.get("/products", routes.api_products);
app.get("/products/details/:id", routes.api_products_details);
app.get("/many/:username", routes.api_fproducts);
app.get("/stores/:storename", routes.api_store);
app.get("/index", (req, res) => {
  res.set("Content-type", "text/html");
  res.sendFile(path.join(__dirname, "public", "index.html"));
});
app.listen(PORT, () => {
  console.log(`Server listening on http://localhost:${PORT}`);
});
