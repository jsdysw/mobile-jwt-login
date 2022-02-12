const express = require('express');
const morgan = require('morgan');
const dotenv = require('dotenv');

dotenv.config();

const { sequelize } = require('./models');


const app = express();
app.set('port', process.env.PORT || 3000);
sequelize.sync({ force: false })
  .then(() => {
    console.log('데이터베이스 연결 성공');
  })
  .catch((err) => {
    console.error(err);
  });


app.use(morgan('dev'));
app.use(express.json());


app.get('/',(req, res, next) => {
  res.json("hi");
});

app.use((req, res, next) => {
  const error =  new Error(`${req.method} ${req.url} 라우터가 없습니다.`);
  error.status = 404;
  next(error);
});

app.use((err, req, res, next) => {
  res.json({
    status: err.status || 500,
    message: err.message
 });
});

app.listen(app.get('port'), () => {
  console.log(app.get('port'), '번 포트에서 대기 중');
});