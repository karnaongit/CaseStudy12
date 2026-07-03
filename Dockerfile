FROM bitnami/spark:3.5.0

USER root

# Install system dependencies, pip, and notebook execution engines
RUN apt-get update && apt-get install -y python3-pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir numpy pandas scikit-learn nbconvert jupyter

# Set up the application workspace
WORKDIR /app

# Copy the notebook and your data folders into the container
COPY CaseStudy12.ipynb /app/CaseStudy12.ipynb
COPY data/ /content/

# Execute the notebook cells from top to bottom via command line
CMD ["jupyter", "nbconvert", "--to", "notebook", "--execute", "CaseStudy12.ipynb", "--output", "executed_output.ipynb"]