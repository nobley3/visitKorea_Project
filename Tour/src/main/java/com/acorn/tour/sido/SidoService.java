package com.acorn.tour.sido;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SidoService {

	@Autowired
	SidoRepository rep;
	
	public ArrayList<SidoDTO> getSelectAll(){
		ArrayList<SidoDTO> sidoList = rep.selectAll();
		return sidoList;
	}
}
