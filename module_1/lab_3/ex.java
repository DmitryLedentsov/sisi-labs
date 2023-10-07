public class Greeting {
    private long id;
    private String content;
    public long getId() {
             return id;
    }
    public String getContent() { 
        return content;
    }
}

@PostMapping("/test")
    public String greetingSubmit(@ModelAttribute Greeting greeting, Model model) {
    return "hello";
}


@Controller
public class ExploitMeController {
    @GetMapping("/exploitme")
    public String exploitMeForm(User  user, Model model) {
        System.out.println(user);
        return "hello";
    }
}

public class User {
    private String name;
    private Department department;

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public Department getDepartment() {
        return department;
    }
    public void setDepartment(Department department) {
        this.department = department;
    }
}

public class Department {
    private String name;
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
}


