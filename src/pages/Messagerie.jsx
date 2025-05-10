import React, { useState } from 'react';
import DashboardLayout from '../components/Dashboard';
import '../styles/Pages.css';
import defaultPhoto from '../assets/images/72c2c06f-2f1e-4fc6-8a02-2f82ff556595.jpg';

const Messagerie = () => {
  const [selectedConversation, setSelectedConversation] = useState(null);

  const conversations = [
    {
      id: 'L0001',
      name: 'Kome Bakary',
      type: 'L',
      unreadCount: 1,
      photo: defaultPhoto
    },
    {
      id: 'L0010',
      name: 'Israel Irax',
      type: 'L',
      unreadCount: 2,
      photo: defaultPhoto
    },
    {
      id: 'L0120',
      name: 'Fip YVAN',
      type: 'L',
      unreadCount: 0,
      photo: defaultPhoto
    },
    {
      id: 'L0120',
      name: 'Pechrimo M.',
      type: 'L',
      unreadCount: 7,
      photo: defaultPhoto
    },
    {
      id: 'C0123',
      name: 'Gbedolo Kan',
      type: 'C',
      unreadCount: 1,
      photo: defaultPhoto
    },
    {
      id: 'C0234',
      name: 'Jack Baudouin',
      type: 'C',
      unreadCount: 0,
      photo: defaultPhoto
    },
    {
      id: 'C0345',
      name: 'Jordan Kouakou',
      type: 'C',
      unreadCount: 2,
      photo: defaultPhoto
    },
    {
      id: 'C0456',
      name: 'Pouyou PAYA',
      type: 'C',
      unreadCount: 0,
      photo: defaultPhoto
    }
  ];

  const renderChat = () => {
    if (!selectedConversation) return null;

    const messages = [
      {
        id: 1,
        sender: 'support',
        name: 'Aicha Kome',
        message: 'Bonjour Monsieur, je suis Aicha de l\'entreprise Shap. Est-ce que nous pouvons connaitre les raisons de l\'annulation de votre commande de livraison d\'aujourd\'hui svp ?',
        time: '11:05'
      },
      {
        id: 2,
        sender: 'user',
        message: 'Rien de bien grave, j\'ai juste eu un imprévu',
        time: '11:06'
      },
      {
        id: 3,
        sender: 'user',
        message: 'Je m\'excuse des désagréments que cela a pu causer.',
        time: '11:06'
      },
      {
        id: 4,
        sender: 'support',
        name: 'Aicha Kome',
        message: 'Ok Monsieur pas de soucis, nous vous prions de toujours nous faire confiance pour vos prochaines livraisons.',
        time: 'À l\'instant'
      }
    ];

    return (
      <div className="chat-modal">
        <div className="chat-header">
          <button className="back-button" onClick={() => setSelectedConversation(null)}>
            ←
          </button>
          <div className="chat-user-info">
            <div className="chat-avatar">S</div>
            <div className="chat-user-name">
              <h3>Aicha Kome</h3>
              <p>En ligne</p>
            </div>
          </div>
          <div className="chat-actions">
            <button className="video-call">📹</button>
            <button className="voice-call">📞</button>
          </div>
        </div>
        <div className="chat-messages">
          {messages.map(message => (
            <div key={message.id} className={`message ${message.sender}`}>
              {message.sender === 'support' && (
                <div className="message-avatar">S</div>
              )}
              <div className="message-content">
                {message.sender === 'support' && (
                  <span className="message-name">{message.name}</span>
                )}
                <p className="message-text">{message.message}</p>
                <span className="message-time">{message.time}</span>
              </div>
            </div>
          ))}
        </div>
        <div className="chat-input">
          <input type="text" placeholder="Écrire un message" />
          <button className="emoji-button">😊</button>
          <button className="send-button">➤</button>
        </div>
      </div>
    );
  };

  return (
    <DashboardLayout>
      <div className="page-content">
        <div className="messagerie-container">
          {!selectedConversation ? (
            <div className="conversations-list">
              {conversations.map(conv => (
                <div 
                  key={conv.id}
                  className="conversation-item"
                  onClick={() => setSelectedConversation(conv)}
                >
                  <div className="conversation-avatar">
                    <img src={conv.photo} alt={conv.name} />
                  </div>
                  <div className="conversation-info">
                    <span className="conversation-name">
                      {conv.name}/{conv.type}{conv.id}
                    </span>
                  </div>
                  {conv.unreadCount > 0 && (
                    <div className="unread-count">{conv.unreadCount}</div>
                  )}
                  <div className="message-icon">💬</div>
                </div>
              ))}
            </div>
          ) : (
            renderChat()
          )}
        </div>
      </div>
    </DashboardLayout>
  );
};

export default Messagerie; 