import React from 'react';
import DashboardLayout from '../components/Dashboard';
import { 
  Chart as ChartJS, 
  ArcElement, 
  Tooltip, 
  Legend,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  BarElement,
  Title,
  RadialLinearScale
} from 'chart.js';
import { Pie, Line, Bar, PolarArea, Doughnut } from 'react-chartjs-2';
import '../styles/Pages.css';

ChartJS.register(
  ArcElement, 
  Tooltip, 
  Legend,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  BarElement,
  Title,
  RadialLinearScale
);

const Dashboard = () => {
  // Données pour le graphique des clients
  const clientsData = {
    labels: ['Clients Actifs', 'Clients Inactifs', 'Clients Réguliers'],
    datasets: [
      {
        data: [500, 200, 300],
        backgroundColor: [
          'rgba(147, 104, 255, 0.8)',  // Violet
          'rgba(255, 159, 64, 0.8)',   // Orange
          'rgba(75, 192, 192, 0.8)',   // Turquoise
        ],
        borderColor: [
          'rgba(147, 104, 255, 1)',
          'rgba(255, 159, 64, 1)',
          'rgba(75, 192, 192, 1)',
        ],
        borderWidth: 2,
      },
    ],
  };

  // Données pour le graphique des livreurs
  const livreursData = {
    labels: ['Livreurs en Activité', 'Livreurs Suspendus', 'Livreurs Inactifs'],
    datasets: [
      {
        data: [30, 10, 5],
        backgroundColor: [
          'rgba(54, 162, 235, 0.8)',   // Bleu
          'rgba(255, 99, 132, 0.8)',   // Rose
          'rgba(255, 206, 86, 0.8)',   // Jaune
        ],
        borderColor: [
          'rgba(54, 162, 235, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 206, 86, 1)',
        ],
        borderWidth: 2,
      },
    ],
  };

  // Données pour le graphique des livraisons par heure
  const livraisonsData = {
    labels: ['6h', '7h', '8h', '9h', '10h', '11h', '12h', '13h', '14h', '15h', '16h', '17h', '18h', '19h', '20h'],
    datasets: [
      {
        label: 'Livraisons',
        data: [2, 5, 8, 12, 15, 20, 18, 10, 12, 15, 22, 25, 20, 15, 10],
        borderColor: 'rgba(255, 87, 51, 1)',
        backgroundColor: 'rgba(255, 87, 51, 0.2)',
        tension: 0.4,
        fill: true,
      },
      {
        label: 'Commandes',
        data: [3, 7, 10, 15, 18, 22, 20, 12, 15, 18, 25, 28, 22, 17, 12],
        borderColor: 'rgba(52, 152, 219, 1)',
        backgroundColor: 'rgba(52, 152, 219, 0.2)',
        type: 'bar',
      }
    ]
  };

  const barChartOptions = {
    responsive: true,
    plugins: {
      legend: {
        position: 'bottom',
        labels: {
          color: 'white',
          font: {
            size: 12
          }
        }
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        grid: {
          color: 'rgba(255, 255, 255, 0.1)'
        },
        ticks: {
          color: 'white'
        }
      },
      x: {
        grid: {
          display: false
        },
        ticks: {
          color: 'white'
        }
      }
    }
  };

  const polarAreaOptions = {
    responsive: true,
    plugins: {
      legend: {
        position: 'bottom',
        labels: {
          color: 'white',
          font: {
            size: 12
          }
        }
      }
    },
    scales: {
      r: {
        ticks: {
          color: 'white'
        },
        grid: {
          color: 'rgba(255, 255, 255, 0.1)'
        }
      }
    }
  };

  const lineChartOptions = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
        labels: {
          color: 'white',
          font: {
            size: 12
          }
        }
      },
      title: {
        display: true,
        text: 'Répartition des livraisons par heure',
        color: 'white',
        font: {
          size: 16
        }
      }
    },
    scales: {
      y: {
        beginAtZero: true,
        grid: {
          color: 'rgba(255, 255, 255, 0.1)'
        },
        ticks: {
          color: 'white'
        }
      },
      x: {
        grid: {
          color: 'rgba(255, 255, 255, 0.1)'
        },
        ticks: {
          color: 'white'
        }
      }
    }
  };

  const doughnutOptions = {
    responsive: true,
    plugins: {
      legend: {
        position: 'bottom',
        labels: {
          color: 'white',
          font: {
            size: 12
          }
        }
      }
    },
    rotation: -90,
    circumference: 180,
    cutout: '75%',
    maintainAspectRatio: false,
  };

  return (
    <DashboardLayout>
      <div className="page-content">
        <h1>Tableau de bord</h1>
        <div className="stats-grid">
          <div className="stat-card">
            <h3>Total Clients</h3>
            <p className="stat-number">1,000</p>
          </div>
          <div className="stat-card">
            <h3>Total Livreurs</h3>
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

        <div className="chart-grid">
          <div className="chart-card">
            <h3>Répartition des Clients</h3>
            <div className="chart-container">
              <Bar data={clientsData} options={barChartOptions} />
            </div>
          </div>
          <div className="chart-card">
            <h3>Répartition des Livreurs</h3>
            <div className="chart-container doughnut-container">
              <Doughnut data={livreursData} options={doughnutOptions} />
            </div>
          </div>
        </div>

        <div className="chart-full-width">
          <div className="chart-card">
            <div className="chart-container-large">
              <Line data={livraisonsData} options={lineChartOptions} />
            </div>
          </div>
        </div>
      </div>
    </DashboardLayout>
  );
};

export default Dashboard; 