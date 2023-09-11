package com.controller;



import com.model.PlaceDAO;
import list.model.PlaceDTO;
import java.util.*;

public class SegmentedPaths {
    private List<List<String>> paths;

    public SegmentedPaths(List<List<String>> paths) {
        this.paths = paths;
    }

    public List<List<String>> getPaths() {
        return paths;
    }

    public void printPaths() {
        System.out.println("Segmented Paths:");
        for (List<String> path : paths) {
            System.out.println(path);
        }
    }

    public ArrayList<ArrayList<PlaceDTO>> paths() {
    	ArrayList<ArrayList<PlaceDTO>> pathArrArr = new ArrayList<>();
    	ArrayList<PlaceDTO> pathArr = new ArrayList<>();
    	
    	PlaceDAO dao = new PlaceDAO();
    	
        for (List<String> path : paths) {
        	pathArr = new ArrayList<>();;
        	for(String p : path) {
        		pathArr.add(dao.placeSelect(p));
        	}
        		pathArrArr.add(pathArr); 
        }
        return pathArrArr;
    }
}