const express = require("express");
// const bodyParser = require("body-parser"); /* deprecated */
const cors = require("cors");

const app = express();

const corsOptions = {
  origin: "http://localhost:5173",
};

// app.use(cors(corsOptions));

// const corsOptions = {
//   origin: '*',  //http://localhost:3000
//   credentials: true,
// };

app.use(cors(corsOptions));

app.use(function(req, res, next) {
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');
  res.setHeader('Access-Control-Allow-Credentials', true);
  next();
});




// parse requests of content-type - application/json
app.use(express.json()); /* bodyParser.json() is deprecated */

// parse requests of content-type - application/x-www-form-urlencoded
app.use(
  express.urlencoded({ extended: true })
); /* bodyParser.urlencoded() is deprecated */

require("./app/routes/user.routes.js")(app);
require("./app/routes/login.routes.js")(app);
require("./app/routes/tour.routes.js")(app);
require("./app/routes/tourTH.routes.js")(app);
require("./app/routes/tourDoc.routes.js")(app);
require("./app/routes/booking.routes.js")(app);
require("./app/routes/mybooking.routes.js")(app);
require("./app/routes/doc.routes.js")(app);
require("./app/routes/upload.routes.js")(app);
require("./app/routes/guide.routes.js")(app);
// set port, listen for requests
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}.`);
});
