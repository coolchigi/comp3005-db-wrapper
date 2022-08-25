document.getElementById("flex-container").classList.add("hidden");
function search_customers() {
  document.getElementById("flex-container").classList.remove("hidden");
  //document.getElementById("product_results").classList.add("hidden");

  const inputField = document.getElementById("keyword");
  console.log(inputField.value.trim());
  let userDiv = document.getElementById("search_results");
  userDiv.innerHTML = "";
  //clear song details div
  let userDetailsDiv = document.getElementById("item_details");
  userDetailsDiv.innerHTML = "";
  let xhr = new XMLHttpRequest();

  xhr.onreadystatechange = () => {
    if (xhr.readyState == 4 && xhr.status == 200) {
      let data = JSON.parse(xhr.responseText);
      console.log(data.customers_data);
      if (data.customers_data[0] === null) {
        userDiv.innerHTML += `<h3>Customer with name ${inputField.value} doesnt exist<h3>`;
      } else {
        userDiv.innerHTML += `<h3>Data matching: ${inputField.value}</h3><ul style="list-style-type:none">`;
        for (let user of data.customers_data) {
          userDiv.innerHTML += `<table style="width:100%">
  <tr>
    <th>User ID</th>
    <th>User name</th>
  </tr>
  <tr>
    <td>${user.uid}</td>
    <td>${user.uName}</td>
  </tr>
</table>`;
        }
      }
    }
  };

  xhr.open("GET", `/customers?name=${inputField.value}`, true);
  xhr.setRequestHeader("Content-type", "application/json");
  xhr.send();
}

function search_products() {
  document.getElementById("flex-container").classList.remove("hidden");

  const product = document.getElementById("product").value.trim();
  document.getElementById("product").value = product;

  let productDiv = document.getElementById("product_results");
  productDiv.innerHTML = "";
  let url = `/products?category=${product}`;

  let req = new XMLHttpRequest();

  req.onreadystatechange = () => {
    if (req.status === 200 && req.readyState === 4) {
      let data = JSON.parse(req.responseText);

      productDiv.innerHTML += `<h3>Data matching: ${product}</h3><ulstyle="list-style-type:none">`;

      if (data.length === 0) {
        productDiv.innerHTML += "No match was found";
      } else {
        for (const item of data.products) {
          item.forEach((mobile) => {
            productDiv.innerHTML += `<table style="width:50%">
              <tr>
                <th>Product ID</th>
                <th>Product Name</th>
              </tr>
              <br>
              <tr>
                <td onclick=getProductDetails(${mobile.pid})>${mobile.pid}</td>
                <td>${mobile.product_name}</td>
              </tr>
            </table>`;
          });
        }
      }
    }
  };
  req.open("GET", url, true);
  req.setRequestHeader("Content-type", "application/json");
  req.send();
}

function getProductDetails(pid) {
  const url = `/products/details/${pid}`;

  const details = document.getElementById("product_results");

  let req = new XMLHttpRequest();
  req.onreadystatechange = () => {
    if (req.readyState === 4 && req.status === 200) {
      details.innerHTML += " ";
      let data = JSON.parse(req.responseText);
      data.forEach((item) => {
        details.innerHTML += `<br> <h5>Data:</h5> 
        <table>
        <tr>
        <th>Product ID<th>
        <th>Name<th>
        <th>Category<th>
        <th>Price<th>
        </tr>
        <tr>
        <td>
        ${item.pid}
        <td>
        <td>
        ${item.product_name}
        <td>
        <td>
        ${item.category}
        <td>
        <td>
        ${item.price}
        <td>
        
        <tr>
        
        
        
        
        <table>`;
      });
    }
  };
  req.open("GET", url, true);
  req.setRequestHeader("Content-type", "application/json");
  req.send();
}

function search_fproducts() {
  document.getElementById("flex-container").classList.remove("hidden");
  const username = document.getElementById("user_id");
  const details = document.getElementById("many");
  details.innerHTML = "";

  let url = `/many/${username.value}`;

  let req = new XMLHttpRequest();

  req.onreadystatechange = () => {
    if (req.readyState == 4 && req.status == 200) {
      let data = JSON.parse(req.responseText);
      if (data.length === 0) {
        details.innerHTML += `List of favourite products: <br>${username.value} doesnt have a list of favorite products`;
      } else {
        console.log(data);
        details.innerHTML += `<br> List of ${username.value} favorite products`;
        data.forEach((item) => {
          details.innerHTML += `        
        <li> 
         ${item.product_name} 
         </li>`;
        });
      }
    }
  };
  req.open("GET", url, true);
  req.setRequestHeader("Content-type", "application/json");
  req.send();
}

function show_products() {
  document.getElementById("flex-container").classList.remove("hidden");
  const store_name = document.getElementById("sname");
  const details = document.getElementById("products");
  details.innerHTML = "";
  const url = `/stores/${store_name.value}`;
  console.log(store_name.value);

  let req = new XMLHttpRequest();

  req.onreadystatechange = () => {
    if (req.status === 200 && req.readyState === 4) {
      let data = JSON.parse(req.responseText);
      if (data.length === 0) {
        details.innerHTML += `<h4>${store_name.value} doesnt have any products</h4>`;
      } else {
        details.innerHTML += `List of available products at ${store_name.value}`;
        data.forEach((item) => {
          details.innerHTML += `<table>
          <tr>
          <th>Product Name</th>
          <th>Price </th>       
          </tr>
          <tr>
          <td>${item.product_name}</td>
          <td>${item.price}</td>
          </tr>
          
          </table>`;
        });
      }
    }
  };

  req.open("GET", url, true);
  req.setRequestHeader("Content-type", "application/json");
  req.send();
}
