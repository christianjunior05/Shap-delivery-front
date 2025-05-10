import React, { useState } from 'react';
import DashboardLayout from '../components/Dashboard';
import '../styles/Pages.css';

// Import direct de l'image
import defaultPhoto from '../assets/images/72c2c06f-2f1e-4fc6-8a02-2f82ff556595.jpg';

const Livreurs = () => {
  const [activeTab, setActiveTab] = useState('documents');
  const [selectedLivreur, setSelectedLivreur] = useState(null);
  const [showModal, setShowModal] = useState(false);
  const [showCourseModal, setShowCourseModal] = useState(false);
  const [showItineraireModal, setShowItineraireModal] = useState(false);
  const [selectedCourse, setSelectedCourse] = useState(null);
  const [selectedDocument, setSelectedDocument] = useState(null);

  const livreurs = [
    
    {
      id: "0001",
      nom: "Kome Bakary",
      status: true,
      tel: "+237 690 00 00 01", 
      email: "kome.bakary@example.com",
      isActive: true,
      historique: [
        {
          id: "0012/L2345",
          statut: "En cours",
          adresse: "Riv Palm vers Abobo Gare",
          date: "26/02/2025"
        },
        {
          id: "0212/L1234",
          statut: "En attente", 
          adresse: "Riv Bonou vers Yop Sable",
          date: "20/02/2025"
        },
        {
          id: "1025/L0123",
          statut: "Livré",
          adresse: "Coc II Pla vers Riv Palm",
          date: "20/02/2025"
        },
        {
          id: "2135/L2013",
          statut: "Annulé",
          adresse: "Yop Siporex vers Rivera Palmerai",
          date: "01/02/2025"
        }
      ],
      transactions: [
        {
          id: "TR001",
          type: "Crédit",
          montant: "5000 FCFA",
          commande: "CMD001",
          date: "2024-03-20"
        },
        {
          id: "TR002", 
          type: "Débit",
          montant: "-1000 FCFA",
          commande: "CMD002",
          date: "2024-03-21"
        },
        {
          id: "TR001",
          type: "Crédit",
          montant: "5000 FCFA",
          commande: "CMD001",
          date: "2024-03-20"
        },
        {
          id: "TR002", 
          type: "Débit",
          montant: "-1000 FCFA",
          commande: "CMD002",
          date: "2024-03-21"
        }
      ]
    },
   
    {
      id: "0006",
      nom: "Kone Abdoulaye",
      status: false,
      tel: "+237 690 00 00 06",
      email: "kone.abdoulaye@example.com",
      historique: [
        {
          id: "0019/L2352",
          statut: "En cours",
          adresse: "Koumassi vers Port-Bouët",
          date: "19/02/2025"
        }
      ],
      transactions: [
        {
          id: "TR008",
          type: "Crédit",
          montant: "4000 FCFA",
          commande: "CMD008",
          date: "2024-03-14"
        }
      ]
    },
    {
      id: "0007",
      nom: "Bamba Souleymane",
      status: true,
      tel: "+237 690 00 00 07",
      email: "bamba.souleymane@example.com",
      historique: [
        {
          id: "0020/L2353",
          statut: "Livré",
          adresse: "Plateau vers Adjamé",
          date: "18/02/2025"
        },
        {
          id: "0021/L2354",
          statut: "En attente",
          adresse: "Marcory vers Zone 4",
          date: "17/02/2025"
        }
      ],
      transactions: [
        {
          id: "TR009",
          type: "Débit",
          montant: "-2500 FCFA",
          commande: "CMD009",
          date: "2024-03-13"
        }
      ]
    },
    {
      id: "0008",
      nom: "Koné Issouf",
      status: false,
      tel: "+237 690 00 00 08",
      email: "kone.issouf@example.com",
      historique: [
        {
          id: "0022/L2355",
          statut: "Annulé",
          adresse: "Yopougon vers Attécoubé",
          date: "16/02/2025"
        }
      ],
      transactions: [
        {
          id: "TR010",
          type: "Crédit",
          montant: "3500 FCFA",
          commande: "CMD010",
          date: "2024-03-12"
        },
        {
          id: "TR010",
          type: "Crédit",
          montant: "3500 FCFA",
          commande: "CMD010",
          date: "2024-03-12"
        },
        {
          id: "TR010",
          type: "Crédit",
          montant: "3500 FCFA",
          commande: "CMD010",
          date: "2024-03-12"
        }
      ]
    }
  ];

  const renderDocuments = () => (
    <div className="clients-container">
      <div className="clients-grid">
        {livreurs.map(livreur => (
          <div key={livreur.id} className="client-card simplified">
            <div className="client-info">
              <div className="client-photo">
                <img src={defaultPhoto} alt={livreur.nom} />
                {livreur.status ? (
                  <span className="status-icon check">✓</span>
                ) : (
                  <span className="status-icon cross">✗</span>
                )}
              </div>
              <div className="client-name">
                <h3>{livreur.nom}</h3>
              </div>
            </div>
            <button className="voir-button" onClick={() => {setSelectedLivreur(livreur); setShowModal(true)}}>
              Voir
            </button>
          </div>
        ))}
      </div>
    </div>
  );

  const handleOpenModal = (livreur) => {
    setSelectedLivreur(livreur);
    setShowModal(true);
  };

  const handleCloseModal = () => {
    setShowModal(false);
    setSelectedLivreur(null);
  };

  const handleDocumentValidation = (document, status) => {
    // Logique de validation des documents
    console.log(`Document ${document} ${status}`);
  };

  const renderDocumentModal = () => {
    if (!selectedDocument) return null;

    return (
      <div className="document-modal" onClick={() => setSelectedDocument(null)}>
        <button className="close-button" onClick={() => setSelectedDocument(null)}>&times;</button>
        <img src={selectedDocument} alt="Document" onClick={e => e.stopPropagation()} />
      </div>
    );
  };

  const handleStatusChange = (livreur) => {
    const updatedLivreurs = livreurs.map(l => {
      if (l.id === livreur.id) {
        return { ...l, isActive: !l.isActive };
      }
      return l;
    });
    setSelectedLivreur({ ...livreur, isActive: !livreur.isActive });
  };

  const renderModal = () => {
    if (!selectedLivreur || !showModal) return null;

    const modalStyle = {
      maxHeight: '90vh',
      overflowY: 'auto',
      scrollbarWidth: 'none',
      msOverflowStyle: 'none',
    };

    const scrollableListStyle = {
      maxHeight: '300px',
      overflowY: 'auto',
      scrollbarWidth: 'none',
      msOverflowStyle: 'none',
    };

    return (
      <div className="modal-overlay">
        <div className="modal-content" style={modalStyle}>
          <style>
            {`
              .modal-content::-webkit-scrollbar {
                display: none;
              }
              .historique-list::-webkit-scrollbar,
              .transactions-list::-webkit-scrollbar {
                display: none;
              }
              .historique-list,
              .transactions-list {
                -ms-overflow-style: none;
                scrollbar-width: none;
              }
            `}
          </style>
          <button className="close-button" onClick={() => setShowModal(false)}>&times;</button>
          
          <div className="modal-sections">
            {/* Profil du livreur */}
            <div className="profile-section">
              <h2>Profil du Livreur</h2>
              <div className="profile-content">
                <div className="profile-photo-container">
                  <img src={defaultPhoto} alt={selectedLivreur.nom} className="profile-photo" />
                </div>
                <div className="profile-header">
                  <h3>{selectedLivreur.nom}</h3>
                  <button 
                    className={`status-button ${selectedLivreur.isActive ? 'active' : 'suspended'}`}
                    onClick={() => handleStatusChange(selectedLivreur)}
                  >
                    {selectedLivreur.isActive ? 'Actif' : 'Suspendu'}
                  </button>
                </div>
                <div className="profile-details">
                  <div className="detail-item">
                    <span className="label">Nom:</span>
                    <span className="value">{selectedLivreur.nom}</span>
                  </div>
                  <div className="detail-item">
                    <span className="label">ID:</span>
                    <span className="value">{selectedLivreur.id}</span>
                  </div>
                  <div className="detail-item">
                    <span className="label">Téléphone:</span>
                    <span className="value">{selectedLivreur.tel}</span>
                  </div>
                  <div className="detail-item">
                    <span className="label">Email:</span>
                    <span className="value">{selectedLivreur.email}</span>
                  </div>
                </div>
              </div>
            </div>

            {/* Documents */}
            <div className="documents-section">
              <h2>Documents</h2>
              <div className="documents-grid">
                <div className="document-card">
                  <h3>CNI</h3>
                  <div 
                    className="document-preview"
                    onClick={() => setSelectedDocument(defaultPhoto)}
                  >
                    <img src={defaultPhoto} alt="CNI" />
                  </div>
                  <div className="validation-buttons">
                    <button className="validate-button">Valider</button>
                    <button className="reject-button">Rejeter</button>
                  </div>
                </div>
                <div className="document-card">
                  <h3>PERMIS</h3>
                  <div 
                    className="document-preview"
                    onClick={() => setSelectedDocument(defaultPhoto)}
                  >
                    <img src={defaultPhoto} alt="Permis" />
                  </div>
                  <div className="validation-buttons">
                    <button className="validate-button">Valider</button>
                    <button className="reject-button">Rejeter</button>
                  </div>
                </div>
                <div className="document-card">
                  <h3>CARTE GRISE</h3>
                  <div 
                    className="document-preview"
                    onClick={() => setSelectedDocument(defaultPhoto)}
                  >
                    <img src={defaultPhoto} alt="Carte grise" />
                  </div>
                  <div className="validation-buttons">
                    <button className="validate-button">Valider</button>
                    <button className="reject-button">Rejeter</button>
                  </div>
                </div>
              </div>
            </div>

            {/* Historique des commandes */}
            <div className="historique-section">
              <h2>Historique des Commandes</h2>
              <div className="historique-list" style={scrollableListStyle}>
                {[...selectedLivreur.historique].reverse().map(commande => (
                  <div key={commande.id} className="historique-item">
                    <div className="historique-header">
                      <span className="commande-id">#{commande.id}</span>
                      <span className={`commande-status ${commande.statut.toLowerCase().replace(' ', '-')}`}>
                        {commande.statut}
                      </span>
                    </div>
                    <div className="historique-details">
                      <span className="commande-adresse">{commande.adresse}</span>
                      <span className="commande-date">{commande.date}</span>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Transactions */}
            <div className="transactions-section">
              <h2>Historique des Transactions</h2>
              <div className="transactions-list" style={scrollableListStyle}>
                {[...selectedLivreur.transactions].reverse().map(transaction => (
                  <div key={transaction.id} className={`transaction-item ${transaction.type.toLowerCase()}`}>
                    <div className="transaction-icon">
                      <span className="icon">↓</span>
                    </div>
                    <div className="transaction-details">
                      <div className="transaction-main">
                        <span className="transaction-type">{transaction.type}</span>
                        <span className="transaction-montant">{transaction.montant}</span>
                      </div>
                      <div className="transaction-info">
                        <span className="transaction-commande">{transaction.commande}</span>
                        <span className="transaction-date">{transaction.date}</span>
                      </div>
                    </div>
                  </div>
                ))}
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  const renderCourseModal = () => {
    if (!showCourseModal || !selectedCourse) return null;

    return (
      <div className="modal-overlay">
        <div className="modal-content course-modal">
          <button className="close-button" onClick={() => setShowCourseModal(false)}>&times;</button>
          <div className="course-annulee">
            <div className="course-icon">
              <span className="scooter-icon">🛵</span>
            </div>
            <h2>Course annulée</h2>
            <p>Vous avez annulé la course😔</p>
            <p>Destinataire indisponible</p>
            
            <div className="livreur-info">
              <img src={defaultPhoto} alt="Livreur" className="livreur-photo" />
              <div className="livreur-details">
                <h3>KOME Bakary</h3>
                <p>Livreur (L0001)</p>
              </div>
              <div className="livreur-actions">
                <button className="action-button call">
                  <span>📞</span>
                </button>
                <button className="action-button message">
                  <span>💬</span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  const renderItineraireModal = () => {
    if (!showItineraireModal || !selectedCourse) return null;

    return (
      <div className="modal-overlay">
        <div className="modal-content itineraire-modal">
          <button className="close-button" onClick={() => setShowItineraireModal(false)}>&times;</button>
          <div className="course-en-cours">
            <div className="status-banner">
              <h2>Colis pris en charge</h2>
              <h3>Livraison en cours...</h3>
              <p>Votre colis a été récupéré. Le livreur a déjà parcouru 50% du trajet, il est en route vers la destination de livraison...</p>
            </div>

            <div className="livraison-details">
              <div className="detail-item">
                <span className="icon">⏱️</span>
                <div className="detail-content">
                  <label>Durée de la livraison</label>
                  <p>15-30 mins</p>
                </div>
              </div>
              <div className="detail-item">
                <span className="icon">📍</span>
                <div className="detail-content">
                  <label>Adresse de départ</label>
                  <p>Cocody Riv Palmeraie</p>
                </div>
              </div>
              <div className="detail-item">
                <span className="icon">📍</span>
                <div className="detail-content">
                  <label>Adresse de destination</label>
                  <p>Abobo Gare Bingerville</p>
                </div>
              </div>
              <div className="detail-item">
                <span className="icon">💰</span>
                <div className="detail-content">
                  <label>Prix</label>
                  <p>1 500 fr CFA</p>
                </div>
              </div>
            </div>

            <div className="livreur-info">
              <img src={defaultPhoto} alt="Livreur" className="livreur-photo" />
              <div className="livreur-details">
                <h3>Kome Bakary</h3>
                <p>Livreur (L0001)</p>
              </div>
              <div className="livreur-actions">
                <button className="action-button call">
                  <span>📞</span>
                </button>
                <button className="action-button message">
                  <span>💬</span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    );
  };

  const renderSuivi = () => (
    <div className="clients-container">
      <div className="clients-grid">
        {[
          {
            id: "0012/L0001",
            depart: "Riv Palm",
            destination: "Abobo Gare",
            montant: "1 500 Fr cfa",
            statut: "En cours",
            showItineraire: true
          },
          {
            id: "0212/L0010",
            depart: "Riv Bonou",
            destination: "Yop Sable",
            montant: "2 500 Fr cfa",
            statut: "En cours",
            showItineraire: true
          },
          {
            id: "1025/L0121",
            depart: "Coc II Pla",
            destination: "Riv Palm",
            montant: "1 000 Fr cfa",
            statut: "En cours",
            showItineraire: true
          },
          {
            id: "2135/L2013",
            depart: "Yop Siporex",
            destination: "Riv Palm",
            montant: "3 000 Fr cfa",
            statut: "Annulé",
            showItineraire: false
          },
          {
            id: "2135/L0513",
            depart: "Yop Selmer",
            destination: "Riv Faya",
            montant: "2 000 Fr cfa",
            statut: "Annulé",
            showItineraire: false
          },
          {
            id: "2135/L0513",
            depart: "Coc UFHB",
            destination: "Abobo Pk",
            montant: "5 000 Fr cfa",
            statut: "Terminé",
            showItineraire: false
          },
          {
            id: "2135/L0513",
            depart: "Port-Bouet",
            destination: "Koumassi",
            montant: "2 500 Fr cfa",
            statut: "Terminé",
            showItineraire: false
          }
        ].map(livraison => (
          <div key={livraison.id} className="client-card simplified">
            <div className="livraison-content">
              <div className="livraison-header">
                <span className="commande-id">Commande n°{livraison.id}</span>
                <span className={`commande-status ${livraison.statut.toLowerCase()}`}>
                  {livraison.statut}
                </span>
              </div>
              <div className="livraison-trajet">
                <span className="trajet-point">{livraison.depart}</span>
                <span className="trajet-arrow">→</span>
                <span className="trajet-point">{livraison.destination}</span>
              </div>
              <div className="livraison-footer">
                <span className="montant">{livraison.montant}</span>
                {livraison.showItineraire ? (
                  <button 
                    className="voir-button"
                    onClick={() => {
                      setSelectedCourse(livraison);
                      setShowItineraireModal(true);
                    }}
                  >
                    Itinéraire
                  </button>
                ) : (
                  <button 
                    className="voir-button"
                    onClick={() => {
                      setSelectedCourse(livraison);
                      setShowCourseModal(true);
                    }}
                  >
                    Voir
                  </button>
                )}
              </div>
            </div>
          </div>
        ))}
      </div>
      {renderCourseModal()}
      {renderItineraireModal()}
    </div>
  );

  return (
    <DashboardLayout>
      <div className="page-content">
        <div className="page-header">
          <div className="tabs-container">
            <button 
              className={`tab-button ${activeTab === 'documents' ? 'active' : ''}`}
              onClick={() => setActiveTab('documents')}
            >
              Documents
            </button>
            <button 
              className={`tab-button ${activeTab === 'suivi' ? 'active' : ''}`}
              onClick={() => setActiveTab('suivi')}
            >
              Suivi des livraisons
            </button>
          </div>
        </div>
        {activeTab === 'documents' && renderDocuments()}
        {activeTab === 'suivi' && renderSuivi()}
        {showModal && renderModal()}
        {selectedDocument && renderDocumentModal()}
      </div>
    </DashboardLayout>
  );
};

export default Livreurs; 