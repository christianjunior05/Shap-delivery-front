import React, { useState } from 'react';
import DashboardLayout from '../components/Dashboard';
import '../styles/Pages.css';

const Rapports = () => {
  const [activeTab, setActiveTab] = useState('rapports');
  const [showPerformanceModal, setShowPerformanceModal] = useState(false);
  const [showRevenusModal, setShowRevenusModal] = useState(false);

  const renderStars = (count) => {
    return (
      <div className="rating">
        {[...Array(5)].map((_, index) => (
          <span key={index} className={`star ${index < count ? 'filled' : ''}`}>★</span>
        ))}
      </div>
    );
  };

  const renderPerformanceModal = () => (
    <div className="modal-overlay">
      <div className="modal-content performance-modal">
        <button className="close-button" onClick={() => setShowPerformanceModal(false)}>&times;</button>
        <h2>Performance des Livreurs</h2>
        <div className="performance-list">
          <div className="performance-item">
            <span className="livreur-icon">🛵</span>
            <span className="livreur-id">Livreur (L0001) :</span>
            <span className="performance-value">75%</span>
          </div>
          <div className="performance-item">
            <span className="livreur-icon">🛵</span>
            <span className="livreur-id">Livreur (L0010) :</span>
            <span className="performance-value">20%</span>
          </div>
          <div className="performance-item">
            <span className="livreur-icon">🛵</span>
            <span className="livreur-id">Livreur (L2013) :</span>
            <span className="performance-value">90%</span>
          </div>
          <div className="performance-item">
            <span className="livreur-icon">🛵</span>
            <span className="livreur-id">Livreur (L0121) :</span>
            <span className="performance-value">50%</span>
          </div>
        </div>
      </div>
    </div>
  );

  const renderRevenusModal = () => (
    <div className="modal-overlay">
      <div className="modal-content revenus-modal">
        <button className="close-button" onClick={() => setShowRevenusModal(false)}>&times;</button>
        <h2>Revenus Générés</h2>
        <div className="revenus-table-container">
          <table className="revenus-table">
            <thead>
              <tr>
                <th>Période</th>
                <th>Nombre de livraison</th>
                <th>Prix moyen par livraison</th>
                <th>Revenus générés (livreur/mois)</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>Janvier</td>
                <td>400</td>
                <td>1 000</td>
                <td>500 000</td>
              </tr>
              <tr>
                <td>Février</td>
                <td>600</td>
                <td>1 500</td>
                <td>900 000</td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );

  const renderRapports = () => (
    <div className="rapports-container">
      <div className="avis-section">
        <div className="avis-list">
          <div className="avis-item">
            <div className="avis-header">
              <div className="avis-info">
                <span className="client-name">Gbedolo KAN/Client C0123</span>
                <span className="avis-date">Commande n°0012/L0001</span>
              </div>
            </div>
            <div className="rating">
              {"★".repeat(5)}
            </div>
            <p className="commentaire">
              J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux.
            </p>
          </div>

          <div className="avis-item">
            <div className="avis-header">
              <div className="avis-info">
                <span className="client-name">Jack BAUDOUIN/Client C0234</span>
                <span className="avis-date">Commande n°0212/L0010</span>
              </div>
            </div>
            <div className="rating">
              {"★".repeat(4)}
            </div>
            <p className="commentaire">
              J'ai été obligé d'annuler la commande car le temps d'attente était trop long.
            </p>
          </div>

          <div className="avis-item">
            <div className="avis-header">
              <div className="avis-info">
                <span className="client-name">Kome Bakary/Livreur L0001</span>
                <span className="avis-date">Commande n°0012</span>
              </div>
            </div>
            <p className="commentaire">
              J'ai annulé la commande car le client ne répondait plus au téléphone.
            </p>
          </div>

          <div className="avis-item">
            <div className="avis-header">
              <div className="avis-info">
                <span className="client-name">Pouyou PAYA/Client C0456</span>
                <span className="avis-date">Commande n°2135/L2013</span>
              </div>
            </div>
            <div className="rating">
              {"★".repeat(5)}
            </div>
            <p className="commentaire">
              J'ai été agréablement surpris par la rapidité et le professionnalisme de vos services mais j'ai dû annuler la course malgré que le livreur était arrivé à destination car le destinataire ne répondait plus.
            </p>
          </div>

          <div className="avis-item">
            <div className="avis-header">
              <div className="avis-info">
                <span className="client-name">Kome Bakary/Livreur L0001</span>
                <span className="avis-date">Commande n°2140</span>
              </div>
            </div>
            <p className="commentaire">
              Commande annulée car client désagréable et irrespectueux au téléphone.
            </p>
          </div>

          <div className="avis-item">
            <div className="avis-header">
              <div className="avis-info">
                <span className="client-name">Jordan KOUAKOU/Client C0345</span>
                <span className="avis-date">Commande n°1025/L0121</span>
              </div>
            </div>
            <div className="rating">
              {"★".repeat(4)}
            </div>
            <p className="commentaire">
              J'ai reçu mon colis mais le livreur l'a un peu tout abîmé, j'ai quand-même apprécié la rapidité du service.
            </p>
          </div>
        </div>
      </div>
    </div>
  );

  const renderStatistiques = () => (
    <div className="statistiques-container">
      <div className="stats-section">
        <div className="stat-block satisfaction">
          <h3>Taux de satisfaction</h3>
          <div className="formula">
            Taux de satisfaction = <div className="fraction">
              <span className="numerator">Nombre d'étoiles colorées</span>
              <span className="denominator">Nombre total d'étoiles</span>
            </div> × 100
          </div>
          <p className="satisfaction-rate">Notre taux de satisfaction actuel est de <span className="highlight">65%</span></p>
          {renderStars(3)}
        </div>

        <div className="stat-block performance">
          <h3>Performance des livreurs</h3>
          <div className="formula">
            Performance livreur = (<div className="fraction">
              <span className="numerator">Nombre de livraison terminées</span>
              <span className="denominator">Nombre total de livraisons</span>
            </div>) × (<div className="fraction">
              <span className="numerator">Nombre d'étoiles colorées</span>
              <span className="denominator">Nombre total d'étoiles</span>
            </div>) × 100
          </div>
          <button 
            className="action-button performance"
            onClick={() => setShowPerformanceModal(true)}
          >
            Voir la performance des livreurs
          </button>
        </div>

        <div className="stat-block revenus">
          <h3>Revenus générés</h3>
          <div className="formula">
            Revenus générés = Nombre total de livraisons effectuées × Prix moyen par livraison
          </div>
          <p className="price-info">Prix moyen par livraison : Prix moyen des types de livraisons (Express, catégorie 2...)</p>
          <button 
            className="action-button revenus"
            onClick={() => setShowRevenusModal(true)}
          >
            Voir les revenus générés
          </button>
        </div>
      </div>

      {showPerformanceModal && renderPerformanceModal()}
      {showRevenusModal && renderRevenusModal()}
    </div>
  );

  return (
    <DashboardLayout>
      <div className="page-content">
        <div className="page-header">
          <div className="tabs-container">
            <button 
              className={`tab-button ${activeTab === 'rapports' ? 'active' : ''}`}
              onClick={() => setActiveTab('rapports')}
            >
              Rapports
            </button>
            <button 
              className={`tab-button ${activeTab === 'statistiques' ? 'active' : ''}`}
              onClick={() => setActiveTab('statistiques')}
            >
              Statistiques
            </button>
          </div>
        </div>
        {activeTab === 'rapports' && renderRapports()}
        {activeTab === 'statistiques' && renderStatistiques()}
      </div>
    </DashboardLayout>
  );
};

export default Rapports; 