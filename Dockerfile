FROM python:3.11-slim

# Créer un utilisateur non-root
RUN useradd -m appuser

# Répertoire de travail
WORKDIR /app

# Installer les dépendances Python (en root)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copier le code applicatif avec les bons droits
COPY --chown=appuser:appuser . /app

# À partir d’ici, on n’exécute plus rien en root
USER appuser

EXPOSE 4000

# Adapte le nom du fichier si besoin (main.py, app.py, breakableflask.py, etc.)
CMD ["python", "main.py"]
