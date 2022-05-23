/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

/**
 *
 * @author samuel.lim2
 */
public class Room implements Serializable{
    private String roomNumber;
    private int columns;
    private int rows;
    private int maxCapacity = columns*rows;

    public Room(String roomNumber, int columns, int rows, int maxCapacity){
        this.roomNumber = roomNumber;
        this.columns = columns;
        this.rows = rows; 
        this.maxCapacity = maxCapacity;
    }
    
    public int getMaxCapacity() {
        return maxCapacity;
    }
    
}
