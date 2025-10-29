const express = require('express');
const router = express.Router();

// Mock DB access - replace with real DB client
const mockDb = {
  query: async (text, params) => {
    // placeholder response
    return { rows: [] };
  }
};

// Example API to get recent orders (uses optimized query)
router.get('/recent', async (req, res) => {
  try {
    // This would call the optimized SQL query in production
    const rows = []; // await mockDb.query(<optimized_query>)
    res.json({ orders: rows });
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'internal' });
  }
});

module.exports = router;
