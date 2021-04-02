var mysql = require("mysql");

var connectionPool = mysql.createPool(
    {
        host: "localhost",
        user: "root",
        password: "univa",
        database: "news_db",
        debug: false
    }
);

module.exports = connectionPool;