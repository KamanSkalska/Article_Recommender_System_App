const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');

const app = express();
app.use(cors());

// MongoDB Atlas URI (keep this secure in real apps)
const uri = "mongodb+srv://test123:test123@articles.gevnqde.mongodb.net/Recommender_System?retryWrites=true&w=majority";

mongoose.connect(uri, { useNewUrlParser: true, useUnifiedTopology: true })
    .then(() => console.log("✅ MongoDB connected"))
    .catch(err => console.error("❌ MongoDB error:", err.message));

const Article = mongoose.model('Articles', new mongoose.Schema({
    title: String,
    author: {
        name: String
    },
    date: String,
    description: String,
    tags: [String],
}, { collection: 'Articles' }));

app.get('/articles', async (req, res) => {
    try {
        const articles = await Article.find();
        res.json(articles);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

const PORT = 3000;
app.listen(PORT, () => {
    console.log(`🚀 Server running on http://localhost:${PORT}`);
});
