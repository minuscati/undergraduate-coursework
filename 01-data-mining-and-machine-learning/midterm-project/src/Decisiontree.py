#sample methods
import pandas as pd
import numpy as np
from imblearn.over_sampling import RandomOverSampler
from collections import Counter
import matplotlib.pyplot as plt
from sklearn.tree import plot_tree

def split_data(data):
    data_len = data['y'].count()
    split1 = int(data_len * 0.8)
    train_data = data[:split1]
    test_data = data[split1:]
    return train_data, test_data

if __name__ == "__main__":
    # 读取数据
    df_processed = pd.read_csv('../data/processed_data.csv')
    train_data, test_data = split_data(df_processed)


    X_tr = train_data.drop('y', axis=1)  # 去除标签列
    y_tr=train_data['y']
    X_te = test_data.drop('y', axis=1)  # 去除标签列
    y_te=test_data['y']

    print('不经过任何采样处理的原始 y_train 中的分类情况：{}'.format(Counter(y_tr)))

    ros = RandomOverSampler(random_state=0, sampling_strategy='auto') 
    X_ros, y_ros = ros.fit_resample(X_tr, y_tr)
    print('随机过采样后，训练集 y_ros 中的分类情况：{}'.format(Counter(y_ros)))

    # from imblearn.over_sampling import SMOTE
    # sos = SMOTE(random_state=0)
    # X_sos, y_sos = sos.fit_resample(X_tr, y_tr)
    # print('SMOTE过采样后，训练集 y_sos 中的分类情况：{}'.format(Counter(y_sos)))

    # # 同理，综合采样（先过采样再欠采样）
    # # combine 表示组合抽样，所以 SMOTE 与 Tomek 这两个英文单词写在了一起
    # from imblearn.combine import SMOTETomek
    # kos = SMOTETomek(random_state=0)  # 综合采样
    # X_kos, y_kos = kos.fit_resample(X_tr, y_tr)
    # print('综合采样后，训练集 y_kos 中的分类情况：{}'.format(Counter(y_kos)))

    from sklearn.tree import DecisionTreeClassifier
    from sklearn import metrics
    from sklearn.model_selection import GridSearchCV

    clf = DecisionTreeClassifier(criterion='gini', random_state=1234)
    # 梯度优化
    param_grid = {'max_depth':[3,4,5,6], 'max_leaf_nodes':[4, 6, 8, 10]}

    cv = GridSearchCV(clf, param_grid=param_grid, scoring='f1',cv=10)
    # data = [[X_tr, y_tr],
    #     [X_ros, y_ros],
    #     [X_sos, y_sos],
    #     [X_kos, y_kos]]
    
    # for features, labels in data:
    #     cv.fit(features, labels) # 对四组数据分别做模型
    #     predict_test = cv.predict(X_te) 
    #     print('auc:%.3f' %metrics.roc_auc_score(y_te, predict_test), 
    #         'recall:%.3f' %metrics.recall_score(y_te, predict_test),
    #         'precision:%.3f' %metrics.precision_score(y_te, predict_test))

    df=[X_ros, y_ros]
    cv.fit(df[0],df[1])
    predict_test = cv.predict(X_te) 
    print('auc:%.3f' %metrics.roc_auc_score(y_te, predict_test), 
        'recall:%.3f' %metrics.recall_score(y_te, predict_test),
        'precision:%.3f' %metrics.precision_score(y_te, predict_test))
    
    # 训练最佳模型
    best_clf = cv.best_estimator_

    print("最佳参数：", cv.best_params_)
    best_clf = cv.best_estimator_
    print("最佳模型：", best_clf)

    #节点重要性
    feature_importances = best_clf.feature_importances_
    feature_names = X_tr.columns
    feature_importances_sorted, feature_names_sorted = zip(*sorted(zip(feature_importances, feature_names), reverse=True))

    sum=0
    for importance, name in zip(feature_importances_sorted, feature_names_sorted):
        print(f"Feature: {name}, Importance: {importance}")
        sum+=importance
    print(sum)

    #ROC曲线
    # from sklearn.metrics import RocCurveDisplay
    # # RocCurveDisplay(best_clf, X_te, y_te)
    # RocCurveDisplay.from_estimator(best_clf, X_te, y_te)
    # plt.show()
    # print(sum)

    #画决策树
    plt.figure(figsize=(20, 15))
    plot_tree(best_clf, feature_names=feature_names, class_names=["0", "1"], filled=True, rounded=True)
    plt.show()
    print(sum)


