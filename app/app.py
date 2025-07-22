from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return '''
    <html>
    <head>
        <title>DevOps Project</title>
        <style>
            body {
                background-color: #121212;
                color: #ffffff;
                font-family: Arial, sans-serif;
                text-align: center;
                padding-top: 100px;
            }
            h1 {
                color: #00d1b2;
                font-size: 48px;
            }
            p {
                font-size: 20px;
                color: #cccccc;
            }
        </style>
    </head>
    <body>
        <h1>🚀 DevOps Project</h1>
        <p>This Flask app is deployed on AWS EKS using Terraform, Docker, Helm & GitHub Actions.</p>
    </body>
    </html>
    '''

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)

