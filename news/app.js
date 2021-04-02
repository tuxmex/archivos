var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
var expressLayout = require('express-ejs-layouts');
var sessiion = require('express-session');
var flush = require('connect-flash');
var upload = require('express-fileupload');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
var topicsRouter = require('./routes/topics');
var subTopicsRouter = require('./routes/sub-topics');
var newsRouter = require('./routes/news');

// api
var topicApiRouter = require('./routes/api-topics');
var newsApiRouter = require('./routes/api-news');


var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'uploads')));
app.use(sessiion({
  secret: 'secret',
  cookie: { maxAge : 60000},
  resave: false,
  saveUninitialized: false
}));
app.use(flush());
app.use(upload());

app.use(expressLayout);

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use('/topics', topicsRouter);
app.use('/sub-topics', subTopicsRouter);
app.use('/news', newsRouter);
// api
app.use('/api/topics', topicApiRouter);
app.use('/api/news', newsApiRouter);

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;