import React, { useState } from 'react';
import DashboardLayout from '../components/Dashboard';
import '../styles/Pages.css';

// Import des images
import adminPhoto from '../assets/images/Femme.png';
import clientPhoto1 from '../assets/images/portrait-man-sweater-posing.png';
import defaultUserPhoto from '../assets/images/72c2c06f-2f1e-4fc6-8a02-2f82ff556595.jpg';

const Clients = () => {
  const [selectedClient, setSelectedClient] = useState(null);

  const clients = [
    {
      id: 'C0001',
      nom: 'KAN',
      prenom: 'Gbedolo',
      email: 'gbedolo@gmail.com',
      telephone: '+225 07 07 00 00 00',
      motDePasse: 'Gbedolopdd',
      historique: [
        {
          numero: '0012/L2345',
          statut: 'en-cours',
          depart: 'Riv Palm',
          destination: 'Abobo Gare',
          montant: '1 500 Fr cfa',
          date: '26/02/2025'
        },
        {
          numero: '0212/L1234',
          statut: 'en-attente',
          depart: 'Riv Bonou',
          destination: 'Yop Sable',
          montant: '2 500 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '1025/L0123',
          statut: 'terminer',
          depart: 'Coc II Pla',
          destination: 'Riv Palm',
          montant: '1 000 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '2135/L2013',
          statut: 'annuler',
          depart: 'Yop Siporex',
          destination: 'Riv Palm',
          montant: '3 000 Fr cfa',
          date: '01/02/2025'
        }
      ],
      avis: [
        {
          commande: '0012/L0001',
          date: '26/02/2025',
          note: 3,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '24/02/2025',
          note: 2,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '23/02/2025',
          note: 5,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '1025/L0002',
          date: '20/02/2025',
          note: 1,
          commentaire: "J'ai été obligé d'annuler la commande car le temps d'attente était trop long."
        }
      ],
      photo: clientPhoto1
    },
    {
      id: 'C0001',
      nom: 'KAN',
      prenom: 'Gbedolo',
      email: 'gbedolo@gmail.com',
      telephone: '+225 07 07 00 00 00',
      motDePasse: 'Gbedolopdd',
      historique: [
        {
          numero: '0012/L2345',
          statut: 'en-cours',
          depart: 'Riv Palm',
          destination: 'Abobo Gare',
          montant: '1 500 Fr cfa',
          date: '26/02/2025'
        },
        {
          numero: '0212/L1234',
          statut: 'en-attente',
          depart: 'Riv Bonou',
          destination: 'Yop Sable',
          montant: '2 500 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '1025/L0123',
          statut: 'terminer',
          depart: 'Coc II Pla',
          destination: 'Riv Palm',
          montant: '1 000 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '2135/L2013',
          statut: 'annuler',
          depart: 'Yop Siporex',
          destination: 'Riv Palm',
          montant: '3 000 Fr cfa',
          date: '01/02/2025'
        }
      ],
      avis: [
        {
          commande: '0012/L0001',
          date: '26/02/2025',
          note: 3,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '24/02/2025',
          note: 2,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '23/02/2025',
          note: 5,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '1025/L0002',
          date: '20/02/2025',
          note: 1,
          commentaire: "J'ai été obligé d'annuler la commande car le temps d'attente était trop long."
        }
      ],
      photo: clientPhoto1
    },
    {
      id: 'C0001',
      nom: 'KAN',
      prenom: 'Gbedolo',
      email: 'gbedolo@gmail.com',
      telephone: '+225 07 07 00 00 00',
      motDePasse: 'Gbedolopdd',
      historique: [
        {
          numero: '0012/L2345',
          statut: 'en-cours',
          depart: 'Riv Palm',
          destination: 'Abobo Gare',
          montant: '1 500 Fr cfa',
          date: '26/02/2025'
        },
        {
          numero: '0212/L1234',
          statut: 'en-attente',
          depart: 'Riv Bonou',
          destination: 'Yop Sable',
          montant: '2 500 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '1025/L0123',
          statut: 'terminer',
          depart: 'Coc II Pla',
          destination: 'Riv Palm',
          montant: '1 000 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '2135/L2013',
          statut: 'annuler',
          depart: 'Yop Siporex',
          destination: 'Riv Palm',
          montant: '3 000 Fr cfa',
          date: '01/02/2025'
        }
      ],
      avis: [
        {
          commande: '0012/L0001',
          date: '26/02/2025',
          note: 3,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '24/02/2025',
          note: 2,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '23/02/2025',
          note: 5,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '1025/L0002',
          date: '20/02/2025',
          note: 1,
          commentaire: "J'ai été obligé d'annuler la commande car le temps d'attente était trop long."
        }
      ],
      photo: clientPhoto1
    },
    {
      id: 'C0001',
      nom: 'KAN',
      prenom: 'Gbedolo',
      email: 'gbedolo@gmail.com',
      telephone: '+225 07 07 00 00 00',
      motDePasse: 'Gbedolopdd',
      historique: [
        {
          numero: '0012/L2345',
          statut: 'en-cours',
          depart: 'Riv Palm',
          destination: 'Abobo Gare',
          montant: '1 500 Fr cfa',
          date: '26/02/2025'
        },
        {
          numero: '0212/L1234',
          statut: 'en-attente',
          depart: 'Riv Bonou',
          destination: 'Yop Sable',
          montant: '2 500 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '1025/L0123',
          statut: 'terminer',
          depart: 'Coc II Pla',
          destination: 'Riv Palm',
          montant: '1 000 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '2135/L2013',
          statut: 'annuler',
          depart: 'Yop Siporex',
          destination: 'Riv Palm',
          montant: '3 000 Fr cfa',
          date: '01/02/2025'
        }
      ],
      avis: [
        {
          commande: '0012/L0001',
          date: '26/02/2025',
          note: 3,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '24/02/2025',
          note: 2,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '23/02/2025',
          note: 5,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '1025/L0002',
          date: '20/02/2025',
          note: 1,
          commentaire: "J'ai été obligé d'annuler la commande car le temps d'attente était trop long."
        }
      ],
      photo: clientPhoto1
    },
    {
      id: 'C0001',
      nom: 'KAN',
      prenom: 'Gbedolo',
      email: 'gbedolo@gmail.com',
      telephone: '+225 07 07 00 00 00',
      motDePasse: 'Gbedolopdd',
      historique: [
        {
          numero: '0012/L2345',
          statut: 'en-cours',
          depart: 'Riv Palm',
          destination: 'Abobo Gare',
          montant: '1 500 Fr cfa',
          date: '26/02/2025'
        },
        {
          numero: '0212/L1234',
          statut: 'en-attente',
          depart: 'Riv Bonou',
          destination: 'Yop Sable',
          montant: '2 500 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '1025/L0123',
          statut: 'terminer',
          depart: 'Coc II Pla',
          destination: 'Riv Palm',
          montant: '1 000 Fr cfa',
          date: '20/02/2025'
        },
        {
          numero: '2135/L2013',
          statut: 'annuler',
          depart: 'Yop Siporex',
          destination: 'Riv Palm',
          montant: '3 000 Fr cfa',
          date: '01/02/2025'
        }
      ],
      avis: [
        {
          commande: '0012/L0001',
          date: '26/02/2025',
          note: 3,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '24/02/2025',
          note: 2,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '0012/L0001',
          date: '23/02/2025',
          note: 5,
          commentaire: "J'ai été plus que jamais satisfait du service, le livreur était très professionnel et respectueux."
        },
        {
          commande: '1025/L0002',
          date: '20/02/2025',
          note: 1,
          commentaire: "J'ai été obligé d'annuler la commande car le temps d'attente était trop long."
        }
      ],
      photo: clientPhoto1
    },
    {
      id: 'C0002',
      nom: 'DOUMBIA',
      prenom: 'Mariam',
      email: 'mariam.d@gmail.com',
      telephone: '+225 07 07 00 00 01',
      motDePasse: 'Mdp123',
      historique: [],
      avis: [],
      photo: defaultUserPhoto
    },
    {
      id: 'C0003',
      nom: 'KOFFI',
      prenom: 'Jean',
      email: 'jean.k@gmail.com',
      telephone: '+225 07 07 00 00 02',
      motDePasse: 'Koffi2024',
      historique: [],
      avis: [],
      photo: defaultUserPhoto
    }
  ];

  const handleVoir = (client) => {
    setSelectedClient(client);
  };

  const handleClose = () => {
    setSelectedClient(null);
  };

  const getStatusClass = (statut) => {
    return statut.toLowerCase().replace(' ', '-');
  };

  return (
    <DashboardLayout>
      <div className="page-content">
        <div className="clients-container">
          <header className="page-header">
            <h1>Clients</h1>
          </header>

          <div className="clients-grid">
            {clients.map(client => (
              <div key={client.id} className="client-card">
                <div className="client-info">
                  <div className="client-content">
                    <div className="client-header">
                      <span className="client-id">{client.id}</span>
                    </div>
                    <div className="client-details">
                      <div>Tel: {client.telephone}</div>
                      <div>Email: {client.email}</div>
                      <div>Nom et prénom: {client.prenom} {client.nom}</div>
                    </div>
                  </div>
                  <div className="client-photo">
                    <img src={client.photo} alt={`${client.prenom} ${client.nom}`} />
                  </div>
                </div>
                <button className="voir-button" onClick={() => handleVoir(client)}>Voir</button>
              </div>
            ))}
          </div>

          {selectedClient && (
            <div className="modal-overlay">
              <div className="modal-content">
                <button className="close-button" onClick={handleClose}>×</button>
                <div className="modal-grid">
                  <div className="historique-section">
                    <h2>Historique des commandes</h2>
                    <div className="historique-list">
                      {selectedClient.historique
                        .sort((a, b) => new Date(b.date.split('/').reverse().join('-')) - new Date(a.date.split('/').reverse().join('-')))
                        .slice(0, 5)
                        .map((commande, index) => (
                        <div key={index} className="historique-item">
                          <div className="historique-header">
                            <span className="commande-id">Commande n°{commande.numero}</span>
                            <span className={`commande-status ${commande.statut}`}>
                              {commande.statut}
                            </span>
                          </div>
                          <div className="historique-details">
                            <div className="trajet">
                              <span>{commande.depart}</span>
                              <span className="arrow">→</span>
                              <span>{commande.destination}</span>
                            </div>
                            <div className="montant">{commande.montant}</div>
                            <div className="date">{commande.date}</div>
                          </div>
                        </div>
                      ))}
                    </div>
                  </div>
                  <div className="avis-section">
                    <h2>Avis et commentaires</h2>
                    <div className="avis-list">
                      {selectedClient.avis.map((avis, index) => (
                        <div key={index} className="avis-item">
                          <div className="avis-header">
                            <div className="avis-info">
                              <span className="client-name">{selectedClient.prenom} {selectedClient.nom}</span>
                              <span className="avis-date">{avis.date}</span>
                            </div>
                            <div className="commande-ref">Commande n°{avis.commande}</div>
                          </div>
                          <div className="rating">
                            {[...Array(5)].map((_, i) => (
                              <span key={i} className={`star ${i < avis.note ? 'filled' : ''}`}>★</span>
                            ))}
                          </div>
                          <div className="commentaire">{avis.commentaire}</div>
                        </div>
                      ))}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )}
        </div>
      </div>
    </DashboardLayout>
  );
};

export default Clients; 