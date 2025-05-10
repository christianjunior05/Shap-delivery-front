import React from 'react';
import { useNavigate } from 'react-router-dom';
import '../styles/Dashboard.css';

const Dashboard = () => {
  const navigate = useNavigate();

  const handleLogout = () => {
    // Logique de déconnexion ici
    navigate('/login');
  };

  return (
    <div className="dashboard-container">
      <header className="dashboard-header">
        <h1 className="dashboard-logo">Shap</h1>
        <button className="logout-button" onClick={handleLogout}>
          Déconnexion
        </button>
      </header>
      
      <div className="dashboard-content">
        <h2 className="welcome-title">Bienvenue sur le tableau de bord</h2>
        <p className="dashboard-description">
          Interface d'administration pour gérer votre application de livraison.
        </p>
        
        <div className="dashboard-stats">
          <div className="stat-card">
            <h3>Commandes</h3>
            <p className="stat-value">24</p>
          </div>
          <div className="stat-card">
            <h3>Utilisateurs</h3>
            <p className="stat-value">156</p>
          </div>
          <div className="stat-card">
            <h3>Livreurs</h3>
            <p className="stat-value">12</p>
          </div>
        </div>
      </div>
    </div>
  );
};

export default Dashboard; 