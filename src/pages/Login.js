import React, { useState } from 'react';
import { useNavigate, Link } from 'react-router-dom';
import '../styles/Login.css';

const Login = () => {
  const [identifiant, setIdentifiant] = useState('');
  const [motDePasse, setMotDePasse] = useState('');
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    console.log('Connexion avec:', identifiant, motDePasse);
    
    // Simulation de connexion réussie
    // Dans une vraie application, nous ferions une requête API ici
    if (identifiant && motDePasse) {
      navigate('/dashboard');
    }
  };

  return (
    <div className="login-container fade-in">
      <div className="login-content">
        <h1 className="login-logo">Shap</h1>
        <h2 className="login-title">Se connecter</h2>
        
        <form onSubmit={handleSubmit} className="login-form">
          <div className="form-group">
            <input 
              type="text" 
              placeholder="Identifiant" 
              value={identifiant}
              onChange={(e) => setIdentifiant(e.target.value)}
              className="login-input"
              required
            />
          </div>
          
          <div className="form-group">
            <input 
              type="password" 
              placeholder="Mot de passe" 
              value={motDePasse}
              onChange={(e) => setMotDePasse(e.target.value)}
              className="login-input"
              required
            />
          </div>
          
          <button type="submit" className="connexion-button">
            Connexion
          </button>
          
          <div className="forgot-password">
            <Link to="/forgot-password">Mot de passe oublié</Link>
          </div>
        </form>
      </div>
      
      <div className="login-footer">
        <p>© {new Date().getFullYear()} Shap Admin - Tous droits réservés</p>
      </div>
    </div>
  );
};

export default Login; 