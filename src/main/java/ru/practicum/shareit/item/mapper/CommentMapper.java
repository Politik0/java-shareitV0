package ru.practicum.shareit.item.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Component;
import ru.practicum.shareit.item.dto.CommentDto;
import ru.practicum.shareit.item.model.Comment;

@Component
public class CommentMapper {
    private final ModelMapper modelMapper;

    CommentMapper() {
        modelMapper = new ModelMapper();
        modelMapper.createTypeMap(CommentDto.class, Comment.class);
    }

    public CommentDto convertToDto(Comment comment) {
        return modelMapper.map(comment, CommentDto.class);
    }

    public Comment convertFromDto(CommentDto commentDto) {
        return modelMapper.map(commentDto, Comment.class);
    }
}
