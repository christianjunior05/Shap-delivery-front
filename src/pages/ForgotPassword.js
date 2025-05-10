import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import '../styles/ForgotPassword.css';

const ForgotPassword = () => {
  const [email, setEmail] = useState('');
  const [messageSent, setMessageSent] = useState(false);
  const navigate = useNavigate();

  const handleSubmit = (e) => {
    e.preventDefault();
    // Simuler l'envoi d'un e-mail de récupération
    console.log('Récupération de mot de passe pour:', email);
    setMessageSent(true);
    // Dans une application réelle, nous enverrions une requête API ici
  };

  const backToLogin = () => {
    navigate('/login');
  };

  return (
    <div className="forgot-password-container">
      <div className="forgot-password-content">
        <h1 className="forgot-password-logo">Shap</h1>
        <h2 className="forgot-password-title">Mot de passe oublié</h2>
        
        {!messageSent ? (
          <form onSubmit={handleSubmit} className="forgot-password-form">
            <p className="instructions">
              Entrez votre adresse e-mail pour recevoir un lien de réinitialisation.
            </p>
            
            <div className="form-group">
              <input 
                type="email" 
                placeholder="Adresse e-mail" 
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                className="forgot-password-input"
                required
              />
            </div>
            
            <button type="submit" className="submit-button">
              Envoyer
            </button>
            
            <button type="button" className="back-button" onClick={backToLogin}>
              Retour à la connexion
            </button>
          </form>
        ) : (
          <div className="success-message">
            <p>Un e-mail de récupération a été envoyé à {email}.</p>
            <p>Veuillez vérifier votre boîte de réception.</p>
            <button type="button" className="back-button" onClick={backToLogin}>
              Retour à la connexion
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default ForgotPassword; 