// Simple frontend that calls backend API
async function fetchRecent() {
  try {
    const res = await fetch('/api/orders/recent');
    const data = await res.json();
    const container = document.getElementById('orders');
    if (data.orders && data.orders.length) {
      container.innerHTML = '<pre>' + JSON.stringify(data.orders, null, 2) + '</pre>';
    } else {
      container.innerText = 'No recent orders (mock)';
    }
  } catch (e) {
    document.getElementById('orders').innerText = 'Error fetching orders';
  }
}

fetchRecent();
