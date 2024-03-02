from flask import Flask, request, jsonify

# инициализация приложения
app = Flask(__name__)


# роут хелсчека
@app.route("/health", methods=["GET", ])
def health_check():
    if request.method == "GET":
        return jsonify({"status": "OK"})


# роут логики
@app.route("/execute", methods=["POST", ])
def fio_concat():
    # вытаскиваем body и кладем в req (req - это словарь/dict)
    req: dict = request.json
    # бизнес логика
    fio: str = f"{req['surname']} {req['name']} {req['middle_name']}"
    # инициализируем объект ответа (тоже словарь/dict)
    resp: dict = {
        "fio": fio
    }
    # сериализуем ответ в json
    return jsonify(resp)


if __name__ == '__main__':
    app.run(debug=True, host="0.0.0.0", port=8080)
