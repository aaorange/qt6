#include <QGuiApplication>
#include <QQmlApplicationEngine>
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    // ���ø߷ֱ���,������ܳ��ֲ�������ؼ��ߴ��ϵ�ƫ��,�����ڹ���QGuiApplication֮ǰ���ô�����

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);

    engine.load(url); //  ͨ��engine(qml����)ȥ����qml�ļ�

    return app.exec();
}
