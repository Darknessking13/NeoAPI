// express_server.js
// Minimal Express server with CORS and JSON parsing for benchmarking

const express = require('express');
// Create Express app instance
const app = express();

// Define Port
const PORT = process.env.PORT || 7862; // Use a different port than NeoAPI

app.get('/', (req, res) => {
    // Minimal work: set header and send small JSON
    // Express sets Content-Type automatically for res.json
    res.setHeader('Content-Type', 'application/json'); // Still good practice sometimes
    res.end('{"message":"pong"}'); // Use res.end for minimal overhead like NeoAPI example
    // OR: res.json({ message: 'pong' }); // More idiomatic Express, slightly more overhead
});

// --- Start Server ---
app.listen(PORT, () => {
    console.log(`Express benchmark server listening on port ${PORT}...`);
});

console.log('EXPRESS_READY'); 