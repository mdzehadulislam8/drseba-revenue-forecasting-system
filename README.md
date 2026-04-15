# Dr. Seba Client - Commission Revenue Forecasting

একটি AI-powered commission revenue forecasting application যা healthcare professionals এর জন্য তৈরি।

## 📋 Project Overview

এই প্রজেক্টটি দুটি main component দিয়ে তৈরি:
- **FastAPI Backend** (port 8000): Machine learning model এবং prediction API
- **Django Frontend** (port 8001): User-friendly web interface

## 🏗️ Project Structure

```
Another/
├── api/                      # FastAPI Backend
│   ├── main.py              # FastAPI app & endpoints
│   ├── models.py            # Pydantic models
│   ├── config.py            # Configuration
│   └── requirements.txt
├── ui/                       # Django Frontend
│   ├── forecaster/          # Main Django app
│   ├── forecasting_ui/      # Django project settings
│   ├── manage.py
│   └── requirements.txt
├── models/                   # Pre-trained ML models
├── data/                     # Dataset
├── tests/                    # Test files
└── .venv/                    # Virtual environment
```

## 🚀 Getting Started

### Prerequisites
- Python 3.8+
- Virtual Environment

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/yourusername/dr-seba-client.git
cd dr-seba-client
```

2. **Create and activate virtual environment**
```bash
python -m venv .venv
# Windows
.venv\Scripts\Activate.ps1
# macOS/Linux
source .venv/bin/activate
```

3. **Install dependencies**
```bash
# Install API dependencies
cd api
pip install -r requirements.txt
cd ..

# Install UI dependencies
cd ui
pip install -r requirements.txt
cd ..
```

## 📊 Running the Application

### Option 1: Using provided batch files
```bash
./RUN_TEAM_ACCESS.ps1
```

### Option 2: Manual startup

**Terminal 1 - API Server:**
```bash
cd api
python main.py
# API will run on http://localhost:8000
```

**Terminal 2 - Django UI:**
```bash
cd ui
python manage.py runserver 8001 --noreload
# UI will run on http://localhost:8001
```

## 🌐 Access Points

- **UI**: http://localhost:8001 - Commission revenue forecasting interface
- **API Docs**: http://localhost:8000/docs - Interactive API documentation
- **API Health**: http://localhost:8000/health - API health check

## 📈 Features

✅ Single-day commission revenue prediction  
✅ Multi-day forecast (up to 365 days)  
✅ Daily, weekly, and monthly summaries  
✅ Prediction statistics (min, max, mean, std dev)  
✅ District-based analysis  
✅ Specialization-wise insights  
✅ Interactive web interface  
✅ Real-time API integration  

## 🔧 API Endpoints

### POST /predict
Single day commission revenue prediction
```json
{
  "total_bookings": 180,
  "avg_fee": 700,
  "commission_rate": 0.12,
  "service_charge": 60,
  "experience_years": 12,
  "rating_avg": 4.7,
  "district": "Dhaka",
  "specialization_group": "General Physician",
  "hospital_type": "Private Hospital",
  "lag_1": 9500,
  "lag_7": 8800,
  "rolling_mean_7": 9000
}
```

### POST /forecast?days=30
Multi-day forecast with detailed statistics

## 🛑 Stopping the Application

```bash
./STOP_SERVERS.ps1
```

## 💾 Database

- SQLite database for Django (db.sqlite3)
- Pre-trained CatBoost model (models/commission_revenue_forecasting_model.pkl)

## 🧪 Testing

```bash
cd tests
python -m pytest
```

## 📝 Environment Variables

Create `.env` file if needed:
```
DEBUG=True
DJANGO_SETTINGS_MODULE=forecasting_ui.settings
API_BASE_URL=http://localhost:8000
```

## 🐛 Troubleshooting

### "Cannot connect to API"
- Ensure API server is running on port 8000
- Check if both services are active

### Port already in use
- Change port: `python manage.py runserver 8002`

## 👥 Team

- Data Science Team
- Dr. Seba Client Team

## 📄 License

Proprietary - Dr. Seba

## 📧 Support

For issues and queries, contact the development team.

---

**Last Updated**: April 2026
