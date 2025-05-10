import React from 'react';
import Sidebar from '../Sidebar';
import '../styles/Pages.css';

const Dashboard = ({ children }) => {
  return (
    <>
      <Sidebar />
      {children}
    </>
  );
};

export default Dashboard; 