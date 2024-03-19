# app/commands/post_command.rb
class PostCommand < TurboBoost::Commands::Command
  def upvote
    Post.find(controller.params[:id]).increment! :votes
  end
end
