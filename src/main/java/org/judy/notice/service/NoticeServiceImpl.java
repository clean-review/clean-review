package org.judy.notice.service;

import java.util.List;
import java.util.stream.Collectors;

import org.judy.common.util.PageDTO;
import org.judy.notice.dto.NoticeDTO;
import org.judy.notice.mapper.NoticeFileMapper;
import org.judy.notice.mapper.NoticeMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService {

	private final NoticeMapper mapper;
	
	private final NoticeFileMapper fileMapper;
	
	@Override
	public List<NoticeDTO> getList(PageDTO pageDTO) {

		log.info("getlist...............");
		
		
		return mapper.getList(pageDTO).stream().map(notice -> toDTO(notice)).collect(Collectors.toList());
	}

	@Override
	public NoticeDTO getOne(Integer nno) {
	
		return toDTO(mapper.getOne(nno));
	}

	@Override
	@Transactional
	public void insert(NoticeDTO dto) {

		log.info("insert...............");

		dto.getList().forEach(file ->
		{
			file.setNno(dto.getNno());
			fileMapper.insertFile(file);
			
		});
		
		mapper.insert(toDomain(dto));
	}

	@Override
	public int getTotal(PageDTO pageDTO) {
		
		return mapper.getTotal(pageDTO);
	}

	@Override
	public void delete(Integer nno) {
		
		mapper.delete(nno);
		
	}

}
