<div class="row">
    <div class="left col-xs-12 col-sm-4 col-md-3">
        <h3>{lang 'My Profile Photo'}</h3>
        {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}

        <ul>
            <li>
                <a href="{{ $design->url('user','setting','avatar') }}" title="{lang 'Change My Profile Photo'}"><i class="fa fa-upload"></i> {lang 'Change Profile Photo'}</a>
            </li>
            <li>
                <a href="{{ $design->url('user','setting','edit') }}" title="{lang 'Edit My Profile'}"><i class="fa fa-cog fa-fw"></i> {lang 'Edit Profile'}</a>
            </li>
            <li>
                <a href="{{ $design->url('user','setting','design') }}" title="{lang 'My Wallpaper'}"><i class="fa fa-picture-o"></i> {lang 'Design Profile'}</a></li>
            <li>
                <a href="{{ $design->url('user','setting','notification') }}" title="{lang 'My Email Notification Settings'}"><i class="fa fa-envelope-o"></i> {lang 'Notifications'}</a>
            </li>
            <li>
                <a href="{{ $design->url('user','setting','privacy') }}" title="{lang 'My Privacy Settings'}"><i class="fa fa-user-secret"></i> {lang 'Privacy Setting'}</a>
            </li>
            {if $is_valid_license}
                <li>
                    <a href="{{ $design->url('payment','main','info') }}" title="{lang 'My Membership'}"><i class="fa fa-credit-card"></i> {lang 'Membership Details'}</a>
                </li>
            {/if}
            <li><a href="{{ $design->url('user','setting','password') }}" title="{lang 'Change My Password'}"><i class="fa fa-key fa-fw"></i> {lang 'Change Password'}</a></li>
        </ul>
    </div>

    <div class="left col-xs-12 col-sm-6 col-md-6">
        <h3 class="center underline">{lang 'The latest users'}</h3>
        {{ $userDesignModel->profilesBlock() }}

        <h3 class="center underline">{lang 'My friends'}</h3>
        <div class="content" id="friend">
            <script>
                var url_friend_block = '{{ $design->url('user','friend','index',$username) }}';
                $('#friend').load(url_friend_block + ' #friend_block');
            </script>
        </div>
        <div class="clear"></div>

        <h3 class="center underline">{lang 'Visitors who visited my profile'}</h3>
        <div class="content" id="visitor">
            <script>
                var url_visitor_block = '{{ $design->url('user','visitor','index',$username) }}';
                $('#visitor').load(url_visitor_block + ' #visitor_block');
            </script>
        </div>
        <div class="clear"></div>

        {if $is_picture_enabled}
            <h3 class="center underline">{lang 'My photo albums'}</h3>
            <div class="content" id="picture">
                <script>
                    var url_picture_block = '{{ $design->url('picture','main','albums',$username) }}';
                    $('#picture').load(url_picture_block + ' #picture_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        {if $is_video_enabled}
            <h3 class="center underline">{lang 'My video albums'}</h3>
            <div class="content" id="video">
                <script>
                    var url_video_block = '{{ $design->url('video','main','albums',$username) }}';
                    $('#video').load(url_video_block + ' #video_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        {if $is_forum_enabled}
            <h3 class="center underline">{lang 'My discussions'}</h3>
            <div class="content" id="forum">
                <script>
                    var url_forum_block = '{{ $design->url('forum','forum','showpostbyprofile',$username) }}';
                    $('#forum').load(url_forum_block + ' #forum_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        {if $is_note_enabled}
            <h3 class="center underline">{lang 'My notes'}</h3>
            <div class="content" id="note">
                <script>
                    var url_note_block = '{{ $design->url('note','main','author',$username) }}';
                    $('#note').load(url_note_block + ' #note_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        <h2 class="center underline italic s_tMarg">{lang 'Quick User Search'}</h2>
        {{ SearchUserCoreForm::quick() }}
    </div>

    <div class="left col-xs-12 col-sm-2 col-md-3">
        <h3>{lang 'The latest news'}</h3>
        <div id="wall"></div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('ul.zoomer_pic').slick({
            dots: true,
            infinite: false,
            slidesToShow: 6,
            slidesToScroll: 6,
            adaptiveHeight: true
        })
    });
</script>
