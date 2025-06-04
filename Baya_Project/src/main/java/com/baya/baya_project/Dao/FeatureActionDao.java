package com.baya.baya_project.Dao;

import com.baya.baya_project.Model.FeatureAction;
import org.jdbi.v3.core.Jdbi;

import java.util.AbstractMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class FeatureActionDao {
    private Jdbi jdbi;
    public FeatureActionDao() {
        jdbi = JDBIConnector.getJdbi();
    }
    public List<Integer> getActions(int featureID) {
        return jdbi.withHandle(ha -> {
            return ha.createQuery("SELECT actionID\n" +
                    "FROM permissions \n" +
                    "WHERE featureID = ?"
            ).bind(0, featureID).mapTo(Integer.class).list();
        });
    }

//    public List<FeatureAction> getFeaturesWithActions() {
//        String sql = """
//        SELECT f.featureID, f.featureName, p.actionID
//        FROM features f
//        JOIN permissions p ON f.featureID = p.featureID
//    """;
//
//        return jdbi.withHandle(handle -> {
//            List<Map<String, Object>> rows = handle.createQuery(sql)
//                    .mapToMap()
//                    .list();
//
//            // Debug: In dữ liệu để kiểm tra
//            System.out.println("Rows from DB: " + rows);
//            rows.forEach(row -> System.out.println(
//                    "featureID: " + row.get("featureid") +
//                            ", featureName: " + row.get("featurename") +
//                            ", actionID: " + row.get("actionid")
//            ));
//
//            return rows.stream()
//                    .filter(row -> row.get("featureid") != null && row.get("featurename") != null && row.get("actionid") != null)
//                    .collect(Collectors.groupingBy(
//                            row -> new AbstractMap.SimpleEntry<>(
//                                    ((Number) row.get("featureid")).intValue(),
//                                    (String) row.get("featurename")
//                            ),
//                            Collectors.mapping(
//                                    row -> ((Number) row.get("actionid")).intValue(),
//                                    Collectors.toList()
//                            )
//                    ))
//                    .entrySet()
//                    .stream()
//                    .filter(entry -> entry.getKey() != null)
//                    .map(entry -> new FeatureAction(
//                            entry.getKey().getKey(),
//                            entry.getKey().getValue(),
//                            entry.getValue()
//                    ))
//                    .collect(Collectors.toList());
//        });
//    }
    public List<FeatureAction> getFeaturesWithActions() {
        String sql = """
        SELECT f.featureID, f.featureName, p.actionID
        FROM features f
        JOIN permissions p ON f.featureID = p.featureID
    """;

        return jdbi.withHandle(handle -> {
            List<Map<String, Object>> rows = handle.createQuery(sql)
                    .mapToMap()
                    .list();

            System.out.println("Rows from DB: " + rows);
            rows.forEach(row -> System.out.println(
                    "featureID: " + row.get("featureid") +
                            ", featureName: " + row.get("featurename") +
                            ", actionID: " + row.get("actionid")
            ));

            return rows.stream()
                    .filter(row -> row.get("featureid") != null && row.get("featurename") != null && row.get("actionid") != null)
                    .collect(Collectors.groupingBy(
                            row -> new AbstractMap.SimpleEntry<>(
                                    ((Number) row.get("featureid")).intValue(),
                                    (String) row.get("featurename")
                            ),
                            Collectors.mapping(
                                    row -> ((Number) row.get("actionid")).intValue(),
                                    Collectors.collectingAndThen(
                                            Collectors.toList(),
                                            actionIds -> actionIds.stream().sorted().collect(Collectors.toList())
                                    )
                            )
                    ))
                    .entrySet()
                    .stream()
                    .filter(entry -> entry.getKey() != null)
                    .map(entry -> new FeatureAction(
                            entry.getKey().getKey(),
                            entry.getKey().getValue(),
                            entry.getValue()
                    ))
                    .collect(Collectors.toList());
        });
    }

    public static void main(String[] args) {
        FeatureActionDao featureActionDao = new FeatureActionDao();
        System.out.println(featureActionDao.getActions(1));
    }
}
