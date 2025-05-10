import React from 'react';
import DashboardLayout from '../components/Dashboard';
import '../styles/Pages.css';

const Livreurs = () => {
  const livreurs = [
    { id: 1, nom: 'Dupont Jean', email: 'jean.d@email.com', telephone: '0123456792', zone: 'Nord', statut: 'En livraison' },
    { id: 2, nom: 'Petit Marie', email: 'marie.p@email.com', telephone: '0123456793', zone: 'Sud', statut: 'Disponible' },
    { id: 3, nom: 'Robert Lucas', email: 'lucas.r@email.com', telephone: '0123456794', zone: 'Est', statut: 'Indisponible' },
  ];

  return (
    <DashboardLayout>
      <div className="page-content">
        <div className="page-header">
          <h1>Gestion des Livreurs</h1>
          <button className="add-button">+ Nouveau Livreur</button>
        </div>

        <div className="table-container">
          <table className="data-table">
            <thead>
              <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Email</th>
                <th>Téléphone</th>
                <th>Zone</th>
                <th>Statut</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              {livreurs.map(livreur => (
                <tr key={livreur.id}>
                  <td>{livreur.id}</td>
                  <td>{livreur.nom}</td>
                  <td>{livreur.email}</td>
                  <td>{livreur.telephone}</td>
                  <td>{livreur.zone}</td>
                  <td>
                    <span className={`status ${livreur.statut.toLowerCase().replace(' ', '-')}`}>
                      {livreur.statut}
                    </span>
                  </td>
                  <td>
                    <div className="action-buttons">
                      <button className="edit-button">Modifier</button>
                      <button className="delete-button">Supprimer</button>
                    </div>
                  </td>
                </tr>
              ))}
            </tbody>
          </table>
        </div>
      </div>
    </DashboardLayout>
  );
};

export default Livreurs; 