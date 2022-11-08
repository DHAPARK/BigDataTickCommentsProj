const express = require("express");
const app = express();

//DB라고 가정
const age10 = {
  "잘가용~": 10,
  "방가룽!!!": 14,
  "으..": 28,
  "정말??": 34,
  no: 100,
  "what?": 120,
};

const age50 = {
  사이다: 300,
  이몽룡: 239,
  독립: 12,
  눈물: 20,
  자연그대로: 34,
  눈이내려: 180,
};

app.set("view engine", "ejs");

app.get("/", (req, res) => {
  res.render("index");
});

app.get("/goChartPage", (req, res) => {
  res.render("chartPage");
});

app.get("/year10", (req, res) => {
  res.json(age10);
});

app.get("/year50", (req, res) => {
  res.json(age50);
});

app.listen(3000, () => {
  console.log(`3000번 포트로 대기중...`);
});
