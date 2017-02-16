# iWord

我记单词

1.公用的代码

数据库

查单词接口

2.查单词API

[有道词典](http://fanyi.youdao.com/openapi?path=web-mode)

[百度翻译](http://developer.baidu.com/wiki/index.php?title=%E7%99%BE%E5%BA%A6%E7%BF%BB%E8%AF%91%E5%92%8C%E8%AF%8D%E5%85%B8API&diff=16890&oldid=1384)

[金山词霸](http://open.iciba.com/?c=api)

[韦氏词典](http://www.dictionaryapi.com/=)


3.有道api json

```
{
    basic =     {
        explains =         (
            "n. \U8868\U793a\U95ee\U5019\Uff0c \U60ca\U5947\U6216\U5524\U8d77\U6ce8\U610f\U65f6\U7684\U7528\U8bed",
            "int. \U5582\Uff1b\U54c8\U7f57",
            "n. (Hello)\U4eba\U540d\Uff1b(\U6cd5)\U57c3\U6d1b"
        );
        phonetic = "h\U0259'l\U0259\U028a; he-";
        "uk-phonetic" = "h\U0259'l\U0259\U028a; he-";
        "us-phonetic" = "h\U025b\U02c8lo, h\U0259-";
    };
    errorCode = 0;
    query = hello;
    translation =     (
        "\U4f60\U597d"
    );
    web =     (
                {
            key = Hello;
            value =             (
                "\U4f60\U597d",
                "\U60a8\U597d",
                Hello
            );
        },
                {
            key = "Hello Kitty";
            value =             (
                "\U51ef\U8482\U732b",
                "\U6635\U79f0",
                "\U533f\U79f0"
            );
        },
                {
            key = "Hello Bebe";
            value =             (
                "\U54c8\U4e50\U54c8\U4e50",
                "\U4e50\U6263\U4e50\U6263"
            );
        }
    );
}

```
金山API json

```
{
    exchange =     {
        "word_done" = "";
        "word_er" = "";
        "word_est" = "";
        "word_ing" = "";
        "word_past" = "";
        "word_pl" =         (
            hellos
        );
        "word_third" = "";
    };
    "is_CRI" = 1;
    items =     (
        ""
    );
    symbols =     (
                {
            parts =             (
                                {
                    means =                     (
                        "\U54c8\U55bd\Uff0c\U5582",
                        "\U4f60\U597d\Uff0c\U60a8\U597d",
                        "\U8868\U793a\U95ee\U5019",
                        "\U6253\U62db\U547c"
                    );
                    part = "int.";
                },
                                {
                    means =                     (
                        "\U201c\U5582\U201d\U7684\U62db\U547c\U58f0\U6216\U95ee\U5019\U58f0"
                    );
                    part = "n.";
                },
                                {
                    means =                     (
                        "\U558a\U201c\U5582\U201d"
                    );
                    part = "vi.";
                }
            );
            "ph_am" = "h\U0259\U02c8lo\U028a";
            "ph_am_mp3" = "http://res.iciba.com/resource/amp3/1/0/5d/41/5d41402abc4b2a76b9719d911017c592.mp3";
            "ph_en" = "h\U0259'l\U0259\U028a";
            "ph_en_mp3" = "";
            "ph_other" = "";
            "ph_tts_mp3" = "http://res-tts.iciba.com/5/d/4/5d41402abc4b2a76b9719d911017c592.mp3";
        }
    );
    "word_name" = hello;
}

```