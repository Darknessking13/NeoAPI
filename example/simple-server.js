// simple-server.js - Basic ZyroAPI example

const { ZyroAPI } = require('../lib/zyroapi');

const app = new ZyroAPI({ verbose: true });
const PORT = process.env.PORT || 3000;

// Enable JSON body parser
app.plug(ZyroAPI.jsonParser);

// Enable CORS
app.plug(ZyroAPI.cors, {
    origin: true,
    credentials: true
});

// Basic routes
app.get('/', (req, res) => {
    res.json({ 
        message: 'Welcome to ZyroAPI!',
        version: '0.0.1-preview',
        framework: 'ZyroAPI'
    });
});

app.get('/api/users/:id', (req, res) => {
    res.json({
        userId: req.params.id,
        name: 'John Doe',
        email: 'john@example.com'
    });
});

app.post('/api/data', (req, res) => {
    res.json({
        received: req.body,
        timestamp: new Date().toISOString()
    });
});

// Error handler
app.error((err, req, res) => {
    console.error('Error:', err.message);
    const statusCode = err.statusCode || 500;
    res.status(statusCode).json({
        error: err.message || 'Internal Server Error',
        code: err.code
    });
});

// Launch server
app.launch(PORT, () => {
    console.log(`\n✨ ZyroAPI server running at http://localhost:${PORT}`);
    console.log(`\nTry these endpoints:`);
    console.log(`  GET  http://localhost:${PORT}/`);
    console.log(`  GET  http://localhost:${PORT}/api/users/123`);
    console.log(`  POST http://localhost:${PORT}/api/data\n`);
});
