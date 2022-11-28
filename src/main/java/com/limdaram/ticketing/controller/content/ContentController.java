package com.limdaram.ticketing.controller.content;

import com.limdaram.ticketing.domain.content.ContentDto;
import com.limdaram.ticketing.service.content.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
@RequestMapping("content")
public class ContentController {

    @Autowired
    private ContentService service;

    @GetMapping("register")
    public void register() {

    }
    @Transactional
    @PostMapping("register")
    public String register(
            ContentDto content,
            MultipartFile file,
            RedirectAttributes rttr) {
        System.out.println("등록" + content);
        System.out.println(file.getOriginalFilename());

        int cnt = service.register(content, file);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 등록 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 등록 실패");
        }

        return "redirect:/content/list";
    }

    @GetMapping("list")
    public void list(Model model, ContentDto contentDto) {
        List<ContentDto> list = service.listContent(contentDto);

        model.addAttribute("contentList", list);
    }

    @GetMapping("get")
    public void get(int contentId, Model model) {
        ContentDto content = service.get(contentId);
        System.out.println("조회창 " + contentId);
        model.addAttribute("content", content);

    }

    @GetMapping("modify")
    public void modify(int contentId, Model model) {
        ContentDto content = service.get(contentId);
        System.out.println("수정창 " + contentId);
        model.addAttribute("content", content);
    }

//    수정
    @PostMapping("modify")
    public String modify(ContentDto content, RedirectAttributes rttr) {
        int cnt = service.update(content);
        System.out.println("수정완료 " + content);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 수정 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 수정 실패");
        }

        return "redirect:/content/list";
    }

//    삭제
    @PostMapping("remove")
    public String remove(int contentId, RedirectAttributes rttr) {
        int cnt = service.remove(contentId);
        System.out.println("삭제완료 " + contentId);

        if (cnt == 1) {
            rttr.addFlashAttribute("message", "상품 삭제 완료");
        } else {
            rttr.addFlashAttribute("message", "상품 삭제 실패");
        }

        return "redirect:/content/list";
    }
}
