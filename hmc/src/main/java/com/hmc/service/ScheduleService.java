package com.hmc.service;

import java.util.List;
import java.util.Map;

import com.hmc.dto.UserFavoriteTheather;

public interface ScheduleService {
	
	UserFavoriteTheather getUserFavoriteBranchs(String userId);

}
