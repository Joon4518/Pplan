package com.controller;


import java.util.*;

public class TSPSolver {
    public static double haversineDistance(double lat1, double lon1, double lat2, double lon2) {
        double R = 6371;  // 지구 반지름 (단위: km)
        double dLat = Math.toRadians(lat2 - lat1);
        double dLon = Math.toRadians(lon2 - lon1);
        double a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(dLon / 2) * Math.sin(dLon / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        double distance = R * c;
        return distance;
    }

    public static double calculatePathDistance(List<String> path, Map<String, double[]> points) {
        double distance = 0.0;
        for (int i = 0; i < path.size() - 1; i++) {
            double[] coords1 = points.get(path.get(i));
            double[] coords2 = points.get(path.get(i + 1));
            distance += haversineDistance(coords1[0], coords1[1], coords2[0], coords2[1]);
        }
        return distance;
    }

    public static void generatePermutations(List<String> remaining, List<String> current, List<List<String>> permutations) {
        if (remaining.isEmpty()) {
            permutations.add(new ArrayList<>(current));
            return;
        }

        for (String point : remaining) {
            List<String> newRemaining = new ArrayList<>(remaining);
            newRemaining.remove(point);

            List<String> newCurrent = new ArrayList<>(current);
            newCurrent.add(point);

            generatePermutations(newRemaining, newCurrent, permutations);
        }
    }

    public SegmentedPaths findSegmentedPaths(Map<String, double[]> points) {
        List<String> pointNames = new ArrayList<>(points.keySet());
        List<List<String>> permutations = new ArrayList<>();
        generatePermutations(pointNames, new ArrayList<>(), permutations);

        double minDistance = Double.MAX_VALUE;
        List<String> optimalPath = new ArrayList<>();

        for (List<String> permutation : permutations) {
            double distance = calculatePathDistance(permutation, points);
            if (distance < minDistance) {
                minDistance = distance;
                optimalPath = permutation;
            }
        }

        List<List<String>> segmentedPaths = new ArrayList<>();
        double maxSegmentDistance = 30.0;  // 총거리 30km로 세그먼트를 쪼갬
        List<String> segment = new ArrayList<>();
        double segmentDistance = 0.0;

        for (String point : optimalPath) {
            if (!segment.isEmpty()) {
                double distance = calculatePathDistance(segment, points);
                if (segmentDistance + distance > maxSegmentDistance) {
                    segmentedPaths.add(new ArrayList<>(segment));
                    segment.clear();
                    segmentDistance = 0.0;
                } else {
                    segmentDistance += distance;
                }
            }
            segment.add(point);
        }

        if (!segment.isEmpty()) {
            segmentedPaths.add(new ArrayList<>(segment));
        }

        return new SegmentedPaths(segmentedPaths);
    }
}
