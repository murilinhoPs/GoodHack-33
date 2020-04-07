/* eslint-disable no-console */
const app = require('./app');

app.listen(process.env.PORT, () => {
  console.log(`Server listeinig on port: ${process.env.PORT}`);
});
