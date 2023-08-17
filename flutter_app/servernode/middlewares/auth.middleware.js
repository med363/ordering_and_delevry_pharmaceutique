// auth.middleware.js
const jwt = require('jsonwebtoken');

const authenticate = (req, res, next) => {
    const token = req.header('Authorization'); // Supposons que le token JWT est envoyé dans le header Authorization

    if (!token) {
        return res.status(401).json({ status: false, error: 'Unauthorized' });
    }

    try {
        const decodedToken = jwt.verify(token, 'your-secret-key'); // Remplacez 'your-secret-key' par votre clé secrète JWT
        req.user = decodedToken; // Vous pouvez maintenant accéder aux données du token dans vos routes
        next();
    } catch (error) {
        return res.status(403).json({ status: false, error: 'Invalid token' });
    }
};

module.exports = { authenticate };
