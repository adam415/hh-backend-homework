package ru.hh.homework.at_least_some_backend.dto.query;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonProperty;
import ru.hh.homework.at_least_some_backend.Utils;
import ru.hh.homework.at_least_some_backend.entity.HHResume;

import java.time.format.DateTimeFormatter;

public class HHQueryResumeDto
{
    private String title;
    @JsonProperty("applicant")
    private HHQueryUserDto user;
    @JsonProperty("dateCreate")
    private String createdAt;

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public HHQueryUserDto getUser() { return user; }
    public void setUser(HHQueryUserDto user) { this.user = user; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    public static HHQueryResumeDto fromEntity(HHResume entity)
    {
        if (entity == null) return null;

        var dto = new HHQueryResumeDto();

        dto.setTitle(entity.getTitle());
        dto.setUser(HHQueryUserDto.fromEntity(entity.getUser()));

        var createdAt = entity.getCreatedAt();
        if (createdAt != null)
            dto.setCreatedAt(
                    Utils.formatDateTime(Utils.toMoscowDateTime(createdAt))
            );

        return dto;
    }
}
