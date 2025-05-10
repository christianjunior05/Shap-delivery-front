import React from 'react';
import { useNavigate } from 'react-router-dom';
import '../styles/Welcome.css';

const Welcome = () => {
  const navigate = useNavigate();

  const handleStart = () => {
    navigate('/login');
  };

  return (
    <div className="welcome-container fade-in">
      <div className="welcome-content">
        <h1 className="welcome-logo">Shap</h1>
        <p className="welcome-tagline">Rapide et sécurisé !</p>
        <button className="start-button" onClick={handleStart}>
          Commencez
        </button>
      </div>
    </div>
  );
};

export default Welcome; 