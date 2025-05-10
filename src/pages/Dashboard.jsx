import React from 'react';
import DashboardLayout from '../components/Dashboard';
import '../styles/Pages.css';

const Dashboard = () => {
  return (
    <DashboardLayout>
      <div className="page-content">
        <h1>Tableau de bord</h1>
        <div className="stats-grid">
          <div className="stat-card">
            <h3>Total Clients</h3>
            <p className="stat-number">1,234</p>
          </div>
          <div className="stat-card">
            <h3>Livreurs Actifs</h3>
            <p className="stat-number">45</p>
          </div>
          <div className="stat-card">
            <h3>Livraisons du Jour</h3>
            <p className="stat-number">89</p>
          </div>
          <div className="stat-card">
            <h3>Messages Non Lus</h3>
            <p className="stat-number">10</p>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
};

export default Dashboard; 