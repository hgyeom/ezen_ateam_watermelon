const fs = require('fs');
const http = require('http');

http.createServer((request, response) => {
  fs.readFile('./main.jsp', (error, data) => {
    response.writeHead(200, { 'Content-Type': 'text/html' });
    response.end(data);
  });
}).listen(50002, () => {
  console.log('서버가 동작 중입니다, http://127.0.0.1:50002');
});


