//import package
const express = require("express");
const mongoose = require("mongoose");
const adminRouter = require("./routes/admin");
//import from other files
const authRouter = require("./routes/auth");
const productRouter = require("./routes/products");
const userRouter = require("./routes/user");

//initializations
const PORT = 3000;
const app = express();
const DB ="mongodb+srv://gideon:passwordyangu@cluster0.cbugxxr.mongodb.net/?retryWrites=true&w=majority"

//middleware
//client-> (middleware)server->client
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);
app.use(userRouter);
//connections
mongoose
  .connect(DB)
  .then(() => {
    console.log("Connected successfully");
  })
  .catch((e) => {
    console.log(e);
  });

//CREATING AN API
//http://<your ipaddress>/hello-world
//GET, PUT, POST, DELETE,UPDATE -> CRUD
app.listen(PORT,"0.0.0.0", () => {
  console.log(`connected at port ${PORT}`);
});
//localhost