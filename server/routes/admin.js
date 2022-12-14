const express = require("express");
const adminRouter = express.Router();
const admin = require("../middleware/admin");
const Product = require("../models/product");
//Creating an admin Middleware

//Adding product
adminRouter.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, images, quantity, price, category } = req.body;
    let product = Product({
      name,
      description,
      images,
      quantity,
      price,
      category,
    });
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.state(500).json({ error: e.message });
  }
});

module.exports = adminRouter;