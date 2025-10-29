const express = require('express');
const app = express();
const port = process.env.PORT || 4000;
const ordersRouter = require('./routes/orders');

app.use(express.json());
app.use('/api/orders', ordersRouter);

app.get('/', (req, res) => res.send('WarehouseX Backend running'));
app.listen(port, () => console.log(`Server listening on ${port}`));
