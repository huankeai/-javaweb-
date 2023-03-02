package nameimg;

import bean.Goods;

import java.util.ArrayList;
import java.util.List;

public class ListG {
    static List<Goods> list=new ArrayList<>();

    @Override
    public String toString() {
        return "ListG{" +
                "list=" + list +
                '}';
    }
    public void clear(){
        this.list.clear();
    }

    public void addlist(Goods g){
        this.list.add(g);
    }
    public void dellist(Goods g){
        this.list.remove(g);
    }
    public List<Goods> chakan(){
        return this.list;
    }

    public static void main(String[] args) {
        for (Goods g:list){
            System.out.println(g);
        }
    }
}
