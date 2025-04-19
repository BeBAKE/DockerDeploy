const express = require("express");
const PORT = 5500;

const app = express();
app.use(express.json());

app.get("/health", (req, res) => {
  try {
    res.status(200).json({ message: "server is as" });
  } catch (error) {
    res.status(500).json({ error: "server error" });
  }
});

app.listen(PORT, () => {
  console.log(`Server is running on port : ${PORT}`);
});
