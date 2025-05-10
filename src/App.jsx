import React from "react";
import { BrowserRouter as Router, Routes, Route, Navigate } from "react-router-dom";
import Sidebar from "./Sidebar";
import Clients from "./pages/Clients";
// Les autres pages peuvent être créées plus tard
import "./App.css";

function App() {
  return (
    <Router>
      <div className="dashboard">
        <Sidebar />
        <div className="dashboard-content">
          <Routes>
            <Route path="/" element={<Navigate to="/clients" />} />
            <Route path="/clients" element={<Clients />} />
            <Route path="/livreurs" element={<div>Livreurs</div>} />
            <Route path="/rapports" element={<div>Rapports et statistiques</div>} />
            <Route path="/messagerie" element={<div>Messagerie</div>} />
          </Routes>
        </div>
      </div>
    </Router>
  );
}

export default App; 