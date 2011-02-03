cvi_map.defaultRadius = 0;       //INT 0-100 (px radius)
cvi_map.defaultOpacity = 50; //INT 0-100 (% opacity)
cvi_map.defaultBordercolor = '#333333'; //STR '#000000'-'#ffffff'
cvi_map.defaultAreacolor = '#000'; //STR '#000000'-'#ffffff'
cvi_map.defaultNoborder = true; //BOOLEAN
cvi_map.defaultNofade = false; //BOOLEAN
cvi_map.defaultShowcoords = false; //BOOLEAN
cvi_map.defaultDelayed   = true;         //BOOLEAN
cvi_map.defaultImgsrc    = ''; //STR (path&file)
cvi_map.defaultMapid     = ''; //STR (id)       
/**
 * Called when document is loaded
 */

$(document).ready(function() {
        if (typeof isPocket == "undefined"){
            isPocket = false;isTab = false;isIphone = false;isAndroid = false
                                                                }
        // add focus styling
        if(!isPocket && !isTab){
            $("a").focus(function(){
                    $("a").removeClass("focus")
                        $(this).toggleClass("focus")
                        $(this).parent().parent("tr").mouseenter()
                        });

            $("a").blur(function(){
                    $(this).toggleClass("focus")
                        $(this).parent().parent("tr").mouseleave()
                        });
            $("a").mousedown(function(){

                    $(this).unbind("focus").removeClass("focus")
                        }); 
        }
        
        rel= "Scotland,Scotland1,Scotland2,Scotland3,Scotland4,Scotland5,Scotland6,Scotland7,Scotland8,Scotland9,Scotland10,Scotland11";
        rel2 = "SouthEast,SouthEast2";
        rel3 = "SouthWest,SouthWest1";
        
        $("area[id^='Scotland']").each(function(){$(this).attr("rel",removeElement(rel, $(this).attr("id")));});
        $("area[id^='SouthEast']").each(function(){$(this).attr("rel",removeElement(rel2, $(this).attr("id")));});
        $("area[id^='SouthWest']").each(function(){$(this).attr("rel",removeElement(rel3, $(this).attr("id")));});        
        
        // add hover effect to the map
        cvi_map.add(document.getElementById("map_tight"),  { opacity: 30});
        
        // add the hover effects to the table
        var lastid = null;
        $("tr.row").each(function(){
                var elId = $('area[alt="' + $(this).attr("title") +'"]').attr("id");
                $(this)
                    .mouseenter(function(){
                
                            $("td").removeClass("hover")
                                $("td:eq(1),td:eq(2)",this).addClass("hover")
                        
                                if(elId != lastid){
                                    extAreaOut('map_tight',lastid);
                                    extAreaOver('map_tight',elId);
                                }
                        })
                    .mouseleave(function(){                                               
                            lastid = elId;
                        })
                    })

            // highlight the table row when the user hovers or focuses the map
            $("area").hover(function(){
                    $("td").removeClass("hover")
                        var row = $("tr.row[title='" + $(this).attr("alt") +"']")
                        $("td:eq(1),td:eq(2)",row).addClass("hover")
                        })
        
        

            })
/**
 * Removes the element denoted in the 
 * parameter and any superfluous commas
 * @param p_string
 */
    function removeElement(p_rel, p_item_to_remove)
{
    return p_rel.replace(p_item_to_remove, "")
        .replace(/(^,)|(,$)/g, "")
        .replace(",,", ",");
}

