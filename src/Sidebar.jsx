import React from "react";
import { NavLink, useNavigate } from "react-router-dom";
import "./App.css";
import femmeImage from "./assets/images/Femme.png";

function Sidebar() {
  const navigate = useNavigate();

  const handleLogout = () => {
    // Ici vous pouvez ajouter la logique de déconnexion (suppression du token, etc.)
    navigate('/login');
  };

  return (
    <div className="sidebar">
      <div className="sidebar-header">
        <img src={femmeImage} alt="profil" className="avatar" />
        <div>
          <div className="sidebar-name">Kome Aicha</div>
          <div className="sidebar-role">Administrateur</div>
        </div>
      </div>
      
      <div className="sidebar-links">
        <NavLink to="/dashboard" className={({isActive}) => isActive ? "sidebar-link active" : "sidebar-link"}>
          <i className="fas fa-home"></i>
          Tableau de bord
        </NavLink>
        <NavLink to="/clients" className={({isActive}) => isActive ? "sidebar-link active" : "sidebar-link"}>
          <i className="fas fa-users"></i>
          Clients
        </NavLink>
        <NavLink to="/livreurs" className={({isActive}) => isActive ? "sidebar-link active" : "sidebar-link"}>
          <i className="fas fa-motorcycle"></i>
          Livreurs
        </NavLink>
        <NavLink to="/rapports" className={({isActive}) => isActive ? "sidebar-link active" : "sidebar-link"}>
          <i className="fas fa-chart-bar"></i>
          Rapports et statistiques
        </NavLink>
        <NavLink to="/messagerie" className={({isActive}) => isActive ? "sidebar-link active" : "sidebar-link"}>
          <i className="fas fa-envelope"></i>
          Messagerie <span className="notif">10</span>
        </NavLink>
      </div>

      <button onClick={handleLogout} className="sidebar-link logout">
        <i className="fas fa-sign-out-alt"></i>
        Déconnexion
      </button>
    </div>
  );
}

export default Sidebar; 